{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.alacritty = {
    enable = true;
    theme = "breeze";
    settings = lib.importTOML ./alacritty.toml;
  };
}
