{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    bash
    ffmpeg
    (pkgs.writeScriptBin "trim-mp4" (builtins.readFile ./trim-mp4.sh))
  ];
}
