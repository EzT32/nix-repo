{ lib, config, ... }:
let
  cfg = config.custom.hyprland.keybinds.mouse;
in
{
  options.custom.hyprland.keybinds.mouse = {
    enable = lib.mkEnableOption "Mouse keybinds";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      wayland.windowManager.hyprland.settings = {
        bindm = [
          "SUPER, mouse:272, movewindow"
          "SUPER, mouse:273, resizewindow"
        ];
      };
    };
  };
}
