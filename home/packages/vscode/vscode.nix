{ config, pkgs, ... }:

{
  # Don't install and manage VSCode with nix just yet...
  home.packages = with pkgs; [
  ];

  # ...just copy the config file for now.
  xdg.configFile."Code/User/settings.json".source = ./settings.json;
}
