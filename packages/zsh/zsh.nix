{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh
    zsh-syntax-highlighting
    zoxide
  ];

  home.shell.enableZshIntegration = true;

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "viins";

    # Store zsh configs in ~/.config/zsh
    dotDir = "${config.xdg.configHome}/zsh";

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "sudo" "rust" "ssh-agent"];
      theme = "agnoster";
    };

    shellAliases = {
      "c" = "clear";
      "j" = "just";

      "lsa" = "ls -1FG";
      "lsl" = "ls -l";
      "lsaa" = "ls -a1FG";
      "op" = "dolphin . &>/dev/null &";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}