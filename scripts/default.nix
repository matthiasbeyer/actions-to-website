{ pkgs
, rustTarget
, ...
}:

let
  coverageLinkList = pkgs.writeShellApplication {
    name = "coverageLinkList";
    runtimeInputs = with pkgs; [ git ];

    text = builtins.readFile ./coverage_link_list.sh;
  };

  # We cannot use this inside the flake, because we do not have the git
  # repository available, but we can at least build the script as application,
  # so we get all the automatic shell script checking
  updateCoverageList = pkgs.writeShellApplication {
    name = "updateCoverageList";
    runtimeInputs = [ coverageLinkList ];

    text = builtins.readFile ./update_coverage_list.sh;
  };

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
in
{
  packages = {
    inherit
      coverageLinkList
      updateCoverageList
      createDenyReport
      createOutdatedReport
      ;
  };
}
