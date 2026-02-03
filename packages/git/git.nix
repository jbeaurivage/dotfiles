{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    delta
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;

    settings = {
      user = {
        name = "Justin Beaurivage";
        email = "code@beaurivage.io";
      };

      init = {
        defaultBranch = "main";
      };

      core = {
        pager = "delta";
        editor = "helix";
      };

      interactive = {
        diffFilter = "delta --color-only";
      };

      delta = {
        side-by-side = true;
        navigate = true;
        dark = true;
      };

      merge = {
        conflictStyle = "zdiff3";
      };

      pull = {
        rebase = true;
      };
    };
  };
}
