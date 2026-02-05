{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nh
  ];

  programs.nh = {
    enable = true;

    clean = {
      enable = true;
      extraArgs = "--keep-since 7d --keep 5";
    };
  };
}
