{ lib, config, ... }:
let
  cfg = config.custom.hyprland.keybinds.window;
in
{
  options.custom.hyprland.keybinds.window = {
    enable = lib.mkEnableOption "Window management keybinds";
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
      bind = [
        "SUPER, Q, killactive"

        "SUPERSHIFT, H, movewindow, l"
        "SUPERSHIFT, L, movewindow, r"
        "SUPERSHIFT, K, movewindow, u"
        "SUPERSHIFT, J, movewindow, d"

        # Screen mode
        "SUPER, F, fullscreen, 1"
        "SUPERSHIFT, F, fullscreen, 0"
        "SUPER, G, togglefloating"
      ];

      bindr = [
        "ALT, TAB, cyclenext"
        "ALT, TAB, bringactivetotop"
      ];
    };
  };
}
