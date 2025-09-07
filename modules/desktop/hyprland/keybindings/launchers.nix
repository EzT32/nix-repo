{ lib, config, ... }:
let
  cfg = config.modules.hyprland.keybinds.launchers;
in
{
  options.modules.hyprland.keybinds.launchers = {
    enable = lib.mkEnableOption "Launcher keybinds";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
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
  };
}
