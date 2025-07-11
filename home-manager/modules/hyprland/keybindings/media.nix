{lib, config, ... }:

let
  cfg = config.my.keybinds; # Module from ../options.nix

in {
  config = lib.mkIf cfg.enableMedia {
    wayland.windowManager.hyprland.settings = {
      bind = [
        # Screenshots
        ", PRINT, exec, grim ~/Pictures/screenshot-$(date +'%Y-%m-%d-%H%M%S').png"
        "SHIFT, PRINT, exec, grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +'%Y-%m-%d-%H%M%S').png"
        # Select a region, take a screenshot, and open in swappy for annotation
        "SUPERSHIFT, S, exec, grim -g \"$(slurp)\" - | swappy -f -"
      ];
    };
  };
}
