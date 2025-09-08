{ lib, config, ... }:
let
  cfg = config.modules.desktop.hyprland.keybinds.mouse;
in
{
  options.modules.desktop.hyprland.keybinds.mouse = {
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
