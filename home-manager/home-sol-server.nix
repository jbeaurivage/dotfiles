{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  # Common packages and fonts that don't need extra config
  home.packages = with pkgs; [
    htop
    bat
    fd
    ripgrep
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  imports = [
    ./packages/git.nix
    ./packages/nh.nix

    ./packages/helix/helix.nix
    ./packages/zsh/zsh.nix
  ];

  zshCustomizations = {
    interactiveDesktop = false;
    theme = "bira";
  };

  # Don't change this value without a very good reason
  home.stateVersion = "25.11";

}
