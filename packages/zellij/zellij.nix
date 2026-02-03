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

  # Automatically start zellij, only when using alacritty or Konsole
  programs.zsh.initContent = ''
    if [[ "$TERM" == "alacritty" || -n "$KONSOLE_VERSION" ]]; then
      eval "$(zellij setup --generate-auto-start zsh)"
    fi
  '';
}
