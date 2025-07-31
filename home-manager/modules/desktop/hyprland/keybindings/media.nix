# keybindings/media.nix

{lib, config, ... }:

with lib;

let
  cfg = config.my.keybinds;
in {
  config = mkIf cfg.enableMedia {
    wayland.windowManager.hyprland.settings = {
      bind = [
        # Screenshots
        ", PRINT, exec, grim ~/Pictures/screenshot-$(date +'%Y-%m-%d-%H%M%S').png"
        "SHIFT, PRINT, exec, grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +'%Y-%m-%d-%H%M%S').png"
        # Select a region, take a screenshot, and open in swappy for annotation
        "SUPERSHIFT, S, exec, grim -g \"$(slurp)\" - | swappy -f -"
      ];

      bindl = [
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"

        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 10%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 10%-"
      ];
    };
  };
}
