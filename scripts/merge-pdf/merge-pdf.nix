{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    bash
    ghostscript
    (pkgs.writeScriptBin "merge-pdf" (builtins.readFile ./merge-pdf.sh))
  ];
}
