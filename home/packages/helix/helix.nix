{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    helix
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
  };

  xdg.configFile."helix/config.toml".source = ./config.toml;
  xdg.configFile."helix/languages.toml".source = ./languages.toml;
  xdg.configFile."helix/themes/jaybee.toml".source = ./themes/jaybee.toml;
}
