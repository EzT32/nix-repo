# keybindings/media.nix
{lib, config, ... }:
let
  cfg = config.custom.keybinds.media;
in {
  options.custom.keybinds.media = {
    enable = lib.mkEnableOption "Media keybinds";

    volumeStep = lib.mkOption {
      type = lib.types.int;
      default = 5;
      description = "Percentage change in volume";
      example = 5;
    };

    maxVolume = lib.mkOption {
      type = lib.types.float;
      default = 1.0;
      description = "Max volume level";
      example = 1.0;
    };
  };


  config = lib.mkIf cfg.enable {
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
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l ${toString cfg.maxVolume} @DEFAULT_AUDIO_SINK@ ${toString cfg.volumeStep}%+"

        ", XF86AudioLowerVolume, exec, wpctl set-volume -l ${toString cfg.maxVolume} @DEFAULT_AUDIO_SINK@ ${toString cfg.volumeStep}%-"
      ];
    };
  };
}
