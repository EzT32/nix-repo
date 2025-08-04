{lib, config, ... }:
let
  cfg = config.custom.keybinds.mouse;
in {
  options.custom.keybinds.mouse = {
    enable = lib.mkEnableOption "Mouse keybinds";
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];
    };
  };
}
