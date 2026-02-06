{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # trim-mp4 dependency
    ffmpeg
    (pkgs.writeScriptBin "trim-mp4" (builtins.readFile ./trim-mp4.sh))

    # merge-pdf dependency
    ghostscript
    (pkgs.writeScriptBin "merge-pdf" (builtins.readFile ./merge-pdf.sh))
  ];
}
