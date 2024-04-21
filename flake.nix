{
  description = "A example repository";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    unstable-nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    crane = {
      url = "github:ipetkov/crane/v0.15.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
  };

  outputs = inputs: inputs.flake-utils.lib.eachSystem [ "x86_64-linux" ]
    (system:
      let
        pkgs = import inputs.nixpkgs {
          inherit system;
          overlays = [
              (import inputs.rust-overlay)
            ];
        };

        callPackage = pkgs.lib.callPackageWith (pkgs // {
          inherit
            callPackage
            craneLib
            src
            version
            rustTarget
            ;

            selfPackages = inputs.self.packages."${system}";
        });

        unstable = import inputs.unstable-nixpkgs {
          inherit system;
        };

        nightlyRustTarget = pkgs.rust-bin.selectLatestNightlyWith (toolchain:
          pkgs.rust-bin.fromRustupToolchain { channel = "nightly-2024-02-07"; components = [ "rustfmt" ]; });
        nightlyCraneLib = (inputs.crane.mkLib pkgs).overrideToolchain nightlyRustTarget;

        rustTarget = pkgs.rust-bin.fromRustupToolchainFile ./rust-toolchain.toml;
        craneLib = (inputs.crane.mkLib pkgs).overrideToolchain rustTarget;

        tomlInfo = craneLib.crateNameFromCargoToml { cargoToml = ./Cargo.toml; };
        inherit (tomlInfo) version;
        pname = "actions-to-website";

        src =
          let
            nixFilter = path: _type: !pkgs.lib.hasSuffix ".nix" path;
            extraFiles = path: _type: !(builtins.any (n: pkgs.lib.hasSuffix n path) [ ".github" ".sh" ]);
            filterPath = path: type: builtins.all (f: f path type) [
              nixFilter
              extraFiles
              pkgs.lib.cleanSourceFilter
            ];
          in
          pkgs.lib.cleanSourceWith {
            src = ./.;
            filter = filterPath;
          };

        buildInputs = [
          pkgs.pkg-config
        ];

        cargoArtifacts = craneLib.buildDepsOnly {
          inherit src pname;
          buildInputs = buildInputs;
        };

        package = craneLib.buildPackage {
          inherit cargoArtifacts buildInputs src pname version;
        };

        rustfmt' = pkgs.writeShellScriptBin "rustfmt" ''
          exec "${nightlyRustTarget}/bin/rustfmt" "$@"
        '';

        customCargoMultiplexer = pkgs.writeShellScriptBin "cargo" ''
          case "$1" in
            +nightly)
              shift
              export PATH="${nightlyRustTarget}/bin/:''$PATH"
              exec ${nightlyRustTarget}/bin/cargo "$@"
              ;;
            *)
              exec ${rustTarget}/bin/cargo "$@"
          esac
        '';

        site = callPackage ./site {};
        scripts = callPackage ./scripts {};
      in
      rec {
        checks = {
          inherit package;

          clippy = craneLib.cargoClippy {
            inherit cargoArtifacts src pname;
            cargoClippyExtraArgs = "--benches --examples --tests --all-features -- --deny warnings";
          };

          fmt = nightlyCraneLib.cargoFmt {
            inherit src pname;
          };

          tests = craneLib.cargoNextest {
            inherit cargoArtifacts buildInputs src pname;

            nativeBuildInputs = [
              pkgs.coreutils
            ];
          };
        }
        // site.checks
        ;

        packages = rec {
          default = package;

          coverage = pkgs.symlinkJoin {
            name = "coverage";
            paths = [
              coverage-html
              coverage-lcov
            ];
          };

          coverage-html = craneLib.cargoLlvmCov {
            inherit cargoArtifacts buildInputs src pname;
            cargoLlvmCovExtraArgs = "--html --output-dir $out";
          };

          coverage-lcov = craneLib.cargoLlvmCov {
            inherit cargoArtifacts buildInputs src pname;

            preBuild = ''
              mkdir $out
            '';

            cargoLlvmCovExtraArgs = "--lcov --output-path $out/lcov";
          };
        }
        // site.packages
        // scripts.packages
        ;

        apps = {
          buildSite = inputs.flake-utils.lib.mkApp {
            drv = pkgs.writeShellApplication {
              name = "buildSite";
              runtimeInputs = [ packages.gems ];

              text = ''
                cd site
                jekyll build --destination ../public
              '';
            };
          };

          serveSite = inputs.flake-utils.lib.mkApp {
            drv = pkgs.writeShellApplication {
              name = "buildSite";
              runtimeInputs = [ packages.gems ];

              text = ''
                cd site
                jekyll serve --destination ../public
              '';
            };
          };

          denyReport = inputs.flake-utils.lib.mkApp {
            drv = pkgs.writeShellApplication {
              name = "denyReport";
              runtimeInputs = [
                pkgs.git
                inputs.self.packages."${system}".createDenyReport
              ];

              text = ''
                mkdir -p site/_data
                createDenyReport > "site/_data/denyreport.json"
              '';
            };
          };

          outdatedReport = inputs.flake-utils.lib.mkApp {
            drv = pkgs.writeShellApplication {
              name = "outdatedReport";
              runtimeInputs = [
                inputs.self.packages."${system}".createOutdatedReport
              ];

              text = ''
                mkdir -p site/_data
                createOutdatedReport > "site/_data/outdated.json"
              '';
            };
          };
        };

        devShells.default = pkgs.mkShell {
          buildInputs = buildInputs ++ [];

          nativeBuildInputs = [
            customCargoMultiplexer
            rustfmt'
            rustTarget

            pkgs.cargo-llvm-cov
            pkgs.cargo-deny
            pkgs.cargo-outdated

            pkgs.gitlint
            packages.gems
          ];
        };
      }
    );
}
