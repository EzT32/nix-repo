{ lib, config, ... }:
let
  cfg = config.modules.hyprland.keybinds.mouse;
in
{
  options.modules.hyprland.keybinds.mouse = {
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
