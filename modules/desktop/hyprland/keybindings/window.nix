{ lib, config, ... }:
let
  cfg = config.modules.hyprland.keybinds.window;
in
{
  options.modules.hyprland.keybinds.window = {
    enable = lib.mkEnableOption "Window management keybinds";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
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
  };
}
