{ pkgs
, stdenv
, ruby
, src
, selfPackages
, ...
}:

let
  gems = pkgs.bundlerEnv {
    name = "gems";
    inherit ruby;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
    groups = [ "default" ];
  };

  site = stdenv.mkDerivation {
    name = "site";
    inherit src;

    phases = [ "unpackPhase" "buildPhase" ];

    buildInputs = [gems ruby];

    nativeBuildInputs = [
      selfPackages.coverageLinkList
    ];

    buildPhase = ''
      mkdir $out

      cd ${src}/site
      jekyll build --destination $out/
    '';
  };
in
{
  checks = {};
  packages = {
    inherit
      site
      gems
      ;

  };
}
