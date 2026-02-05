{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.zshCustomizations;
in
{
  # Declare customization options
  options.zshCustomizations = {
    interactiveDesktop = lib.mkOption {
      type = lib.types.bool;
      description = "Enable Zellij and other interactive desktop integrations in Zsh.";
    };

    theme = lib.mkOption {
      type = lib.types.str;
      description = "The theme to use for Zsh.";
    };
  };

  # When there is `options`, we must wrap the configuration in `config`.
  config = {
    home.packages =
      with pkgs;
      [
        zsh
        zoxide
      ]
      ++ lib.optionals cfg.interactiveDesktop [ zellij ];

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
        theme = cfg.theme;
      };

      shellAliases = {
        "c" = "clear";
        "j" = "just";
        "zj" = "zellij";

        "lsa" = "ls -1FG";
        "lsl" = "ls -l";
        "lsaa" = "ls -a1FG";
        "lsal" = "ls -al1FG";
        "op" = "dolphin . &>/dev/null &";
      };

      initContent = ''
        # Open file/directory through xdg portal
        function o(){
          xdg-open $1 &>/dev/null &
        }
      '';
    };

    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.zellij =
      if cfg.interactiveDesktop then
        {
          enable = true;
          enableZshIntegration = true;
          attachExistingSession = true;
          exitShellOnExit = true;
        }
      else
        { enable = false; };

  };

}
