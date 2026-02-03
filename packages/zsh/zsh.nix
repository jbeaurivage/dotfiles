{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh
    zoxide
    zellij
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
      plugins = [
        "git"
        "sudo"
        "rust"
        "ssh-agent"
      ];
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

    initContent = ''
      # Automatically start zellij, only when using alacritty or Konsole
      if [[ "$TERM" == "alacritty" || -n "$KONSOLE_VERSION" ]]; then
        eval "$(zellij setup --generate-auto-start zsh)"
      fi

      function o(){
        xdg-open $1 &>/dev/null &
      }
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zellij = {
    enable = true;
    # # TODO: This integration seems pretty buggy
    # enableZshIntegration = true;
    # attachExistingSession = true;
    # exitShellOnExit = true;
  };

}
