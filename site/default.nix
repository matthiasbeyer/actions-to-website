{ pkgs
, stdenv
, ruby
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
    src = ./.;

    phases = [ "unpackPhase" "buildPhase" ];

    buildInputs = [gems ruby];
    buildPhase = ''
      mkdir $out
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
