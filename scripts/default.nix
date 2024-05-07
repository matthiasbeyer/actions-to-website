{ pkgs
, rustTarget
, ...
}:

let
  # We cannot use this inside the flake, because we do not have the git
  # repository available, but we can at least build the script as application,
  # so we get all the automatic shell script checking
  createDenyReport = pkgs.writeShellApplication {
    name = "createDenyReport";
    runtimeInputs = [ rustTarget pkgs.ruby pkgs.cargo-deny ];

    text = ''
      ruby ${./create-deny-report.rb}
    '';
  };

  # We cannot use this inside the flake, because we do not have the git
  # repository available, but we can at least build the script as application,
  # so we get all the automatic shell script checking
  createOutdatedReport = pkgs.writeShellApplication {
    name = "createOutdatedReport";
    runtimeInputs = [ rustTarget pkgs.ruby pkgs.cargo-outdated ];

    text = ''
      ruby ${./create-outdated-report.rb}
    '';
  };

  # We cannot use this inside the flake, because we do not have the git
  # repository available, but we can at least build the script as application,
  # so we get all the automatic shell script checking
  createLicenseReport = pkgs.writeShellApplication {
    name = "createLicenseReport";
    runtimeInputs = [ rustTarget pkgs.ruby pkgs.cargo-license];

    text = ''
      ruby ${./create-license-report.rb}
    '';
  };
in
{
  packages = {
    inherit
      createDenyReport
      createOutdatedReport
      createLicenseReport
      ;
  };
}
