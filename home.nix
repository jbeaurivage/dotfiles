{ config, pkgs, user, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = user.username;
  home.homeDirectory = user.homeDirectory;

  # Don't change this value
  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  services.ssh-agent = {
    enable = true;
    enableZshIntegration = true;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    # Enable xdg-portal for native file browser (e.g. firefox)
    GTK_USE_PORTAL = 1;
  };

  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];

  # Common packages and fonts that don't need extra config
  home.packages = with pkgs; [
    htop
    bat
    fd
    ripgrep
    just
    bacon
    nixfmt
    jetbrains-mono
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
    ./packages/helix/helix.nix
    ./packages/zsh/zsh.nix
    ./packages/git/git.nix
    ./scripts/merge-pdf/merge-pdf.nix
    ./scripts/trim-mp4/trim-mp4.nix
  ];

}
