{ pkgs
, ...
}:

let
  coverageLinkList = pkgs.writeShellApplication {
    name = "coverageLinkList";
    runtimeInputs = with pkgs; [ git ];

    text = builtins.readFile ./coverage_link_list.sh;
  };
in
{
  packages = {
    inherit
      coverageLinkList
      ;
  };
}
