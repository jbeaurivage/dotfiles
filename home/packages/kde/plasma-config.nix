{
  programs.plasma = {
    enable = true;

    shortcuts = {
      "KDE Keyboard Layout Switcher"."Switch keyboard layout to Canadian (CSA)" = [ ];
      "KDE Keyboard Layout Switcher"."Switch keyboard layout to English (US)" = [ ];
      "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
      "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Ctrl+Alt+K";

      kwin.KrohnkiteBTreeLayout = [ ];
      kwin.KrohnkiteColumnsLayout = [ ];
      kwin.KrohnkiteDecrease = [ ];
      kwin.KrohnkiteFloatAll = "Meta+Shift+F";
      kwin.KrohnkiteFloatingLayout = [ ];
      kwin.KrohnkiteFocusDown = "Meta+S";
      kwin.KrohnkiteFocusLeft = "Meta+A";
      kwin.KrohnkiteFocusNext = "Meta+.";
      kwin.KrohnkiteFocusPrev = "Meta+\\";
      kwin.KrohnkiteFocusRight = [ ];
      kwin.KrohnkiteFocusUp = [ ];
      kwin.KrohnkiteGrowHeight = "Meta+Ctrl+J";
      kwin.KrohnkiteIncrease = "Meta+I";
      kwin.KrohnkiteLowerSurfaceCapacity = [ ];
      kwin.KrohnkiteMeta = [ ];
      kwin.KrohnkiteMonocleLayout = "Meta+M";
      kwin.KrohnkiteNextLayout = "Meta+\\\\,none";
      kwin.KrohnkitePreviousLayout = "Meta+|";
      kwin.KrohnkiteQuarterLayout = [ ];
      kwin.KrohnkiteRaiseSurfaceCapacity = [ ];
      kwin.KrohnkiteRotate = [ ];
      kwin.KrohnkiteRotatePart = [ ];
      kwin.KrohnkiteSetMaster = "Meta+Return";
      kwin.KrohnkiteShiftDown = [ ];
      kwin.KrohnkiteShiftLeft = "Meta+Shift+A";
      kwin.KrohnkiteShiftRight = "Meta+Shift+D";
      kwin.KrohnkiteShiftUp = "Meta+Shift+W";
      kwin.KrohnkiteShrinkHeight = "Meta+Ctrl+K";
      kwin.KrohnkiteShrinkWidth = "Meta+Ctrl+H";
      kwin.KrohnkiteSpiralLayout = [ ];
      kwin.KrohnkiteSpreadLayout = [ ];
      kwin.KrohnkiteStackedLayout = [ ];
      kwin.KrohnkiteStairLayout = [ ];
      kwin.KrohnkiteTileLayout = [ ];
      kwin.KrohnkiteToggleFloat = "Meta+F";
      kwin.KrohnkiteTreeColumnLayout = [ ];
      kwin.KrohnkitegrowWidth = "Meta+Ctrl+L";
      kwin.KrohnkitetoggleDock = [ ];

      kwin."Switch to Desktop 1" = [
        "Ctrl+Num+7"
        "Ctrl+!"
      ];
      kwin."Switch to Desktop 2" = [
        "Ctrl+Num+8"
        "Ctrl+@"
      ];
      kwin."Switch to Desktop 3" = [
        "Ctrl+#"
        "Ctrl+Num+9"
      ];
      kwin."Switch to Desktop 4" = [
        "Ctrl+Num+4"
        "Ctrl+$"
      ];
      kwin."Switch to Desktop 5" = [
        "Ctrl+%"
        "Ctrl+Num+5"
      ];
      kwin."Switch to Desktop 6" = [
        "Ctrl+^"
        "Ctrl+Num+6"
      ];
      kwin."Switch to Desktop 7" = [
        "Ctrl+Num+1"
        "Ctrl+&"
      ];
      kwin."Switch to Desktop 8" = [
        "Ctrl+*"
        "Ctrl+Num+2"
      ];
      kwin."Switch to Desktop 9" = [
        "Ctrl+Num+3"
        "Ctrl+("
      ];
      kwin."Window to Desktop 1" = [
        "Meta+!"
        "Meta+Num+7"
      ];
      kwin."Window to Desktop 2" = [
        "Meta+Num+8"
        "Meta+@"
      ];
      kwin."Window to Desktop 3" = [
        "Meta+Num+9"
        "Meta+#"
      ];
      kwin."Window to Desktop 4" = [
        "Meta+$"
        "Meta+Num+4"
      ];
      kwin."Window to Desktop 5" = [
        "Meta+Num+5"
        "Meta+%"
      ];
      kwin."Window to Desktop 6" = [
        "Meta+Num+6"
        "Meta+^"
      ];
      kwin."Window to Desktop 7" = [
        "Meta+&"
        "Meta+Num+1"
      ];
      kwin."Window to Desktop 8" = [
        "Meta+*"
        "Meta+Num+2"
      ];
      kwin."Window to Desktop 9" = [
        "Meta+("
        "Meta+Num+3"
      ];

      kwin."Window to Next Screen" = "Meta+Shift+Right";
      kwin."Window to Previous Screen" = "Meta+Shift+Left";
      kwin.disableInputCapture = "Meta+Shift+Esc";
      kwin.view_actual_size = "Meta+0";
      kwin.view_zoom_in = [
        "Meta++"
        "Meta+="
      ];
      kwin.view_zoom_out = "Meta+-";

      org_kde_powerdevil.powerProfile = [
        "Battery"
        "Meta+B"
      ];
      plasmashell."activate application launcher" = [
        "Meta"
        "Alt+F1"
      ];

      "services/code-oss.desktop"._launch = "Meta+C";
      "services/firefox.desktop"._launch = "Meta+Z";
      # "services/org.kde.konsole.desktop"._launch = "Meta+X";
      "services/Alacritty.desktop"._launch = "Meta+X";
      "services/org.kde.krunner.desktop"._launch = "Meta+Space";
      "services/org.kde.plasma.emojier.desktop"._launch = "Meta+Ctrl+Alt+Shift+Space";
      "services/org.kde.spectacle.desktop"._launch = "Print";
    };

    configFile = {
      dolphinrc.General.DoubleClickViewAction = "none";
      dolphinrc.General.RememberOpenedTabs = false;
      kcminputrc.Keyboard.NumLock = 0;

      kdeGlobals.General.ColorScheme = "BreezeDark";
      kdeglobals.General.AccentColor = "61,174,233";
      kdeGlobals.Icons.Theme = "breeze-dark";

      kdeglobals.General.fixed = "Hack,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      kdeglobals.General.font = "Noto Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      kdeglobals.KDE.AnimationDurationFactor = 0.7071067811865475;

      klaunchrc.BusyCursorSettings.Bouncing = false;
      klaunchrc.FeedbackStyle.BusyCursor = false;
      klaunchrc.FeedbackStyle.TaskbarButton = false;

      ksmserverrc.General.loginMode = "emptySession";
      ksplashrc.KSplash.Theme = "org.kde.breeze.desktop";

      kwinrc.Desktops.Number = 9;
      kwinrc.Desktops.Rows = 3;

      kwinrc.NightColor.Active = true;
      kwinrc.NightColor.NightTemperature = 5000;

      # Krohnkite settings
      kwinrc.Plugins.krohnkiteEnabled = true;
      kwinrc.Script-krohnkite.dockOrderTop = 0;
      kwinrc.Script-krohnkite.focusMeta = 8;
      kwinrc.Script-krohnkite.limitTileWidthRatio = 1.7;
      kwinrc.Script-krohnkite.newWindowPosition = 2;
      kwinrc.Script-krohnkite.noTileBorder = true;
      # Specific to tierra-pc ultrawide layout
      kwinrc.Script-krohnkite.screenDefaultLayout = "DP-2:ThreeColumn,DP-1:Tile";
      kwinrc.Script-krohnkite.screenGapBetween = 10;
      kwinrc.Script-krohnkite.screenGapBottom = 5;
      kwinrc.Script-krohnkite.screenGapLeft = 5;
      kwinrc.Script-krohnkite.screenGapRight = 5;
      kwinrc.Script-krohnkite.screenGapTop = 5;
      kwinrc.Script-krohnkite.soleWindowNoBorders = true;
      # Specific to tierra-pc ultrawide layout
      kwinrc.Script-krohnkite.soleWindowOutputOverride = "DP-2:50";

      kwinrc.Windows.FocusPolicy = "FocusFollowsMouse";
      kwinrc.Windows.NextFocusPrefersMouse = true;

      kxkbrc.Layout.DisplayNames = ",";
      kxkbrc.Layout.LayoutList = "us,ca";
      kxkbrc.Layout.Use = true;
      plasma-localerc.Formats.LANG = "en_CA.UTF-8";
      plasmarc.Theme.name = "default";
    };
  };
}
