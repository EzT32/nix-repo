{ lib, config, ... }:
let
  cfg = config.custom.hyprland.keybinds.launchers;
in
{
  options.custom.hyprland.keybinds.launchers = {
    enable = lib.mkEnableOption "Launcher keybinds";
  };

  config = lib.mkIf cfg.enable {
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
