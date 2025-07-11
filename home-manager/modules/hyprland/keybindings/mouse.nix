{lib, config, ... }:

let
  cfg = config.my.keybinds; # Module from ../options.nix

in {
  config = lib.mkIf cfg.enableMouse {
    wayland.windowManager.hyprland.settings = {
    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
      ];
    };
  };
}
