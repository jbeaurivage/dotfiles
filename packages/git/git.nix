{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    settings.user.name = "Justin Beaurivage";
    settings.user.email = "code@beaurivage.io";
  };
}
