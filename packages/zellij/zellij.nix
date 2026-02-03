{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zellij
  ];

  programs.zellij = {
    enable = true;
    # attachExistingSession = true;
    # exitShellOnExit = true;
    # enableZshIntegration = true;
  };

  programs.zsh.initContent = ''
    if [[ "$TERM" == "alacritty" ]]; then
      eval "$(zellij setup --generate-auto-start zsh)"
    fi
  '';
}
