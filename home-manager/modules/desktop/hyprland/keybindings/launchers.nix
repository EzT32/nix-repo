{lib, config, ... }:

let
  cfg = config.my.keybinds;

in {
  config = lib.mkIf cfg.enableLaunchers {
    wayland.windowManager.hyprland.settings = {
      bind = [
        "SUPER, T, exec, kitty"
        "SUPERSHIFT, B, exec, firefox"
      ];

      bindr = [
        "SUPER, SUPER_L, exec, kill $(pidof rofi) || rofi -show drun"
      ];
    };
  };
}
