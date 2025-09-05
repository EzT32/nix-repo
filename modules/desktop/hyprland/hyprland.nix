{ lib, config, ... }:
let
  cfg = config.custom.hyprland;
in
{
  options.custom.hyprland = {
    enable = lib.mkEnableOption "Enable custom hyprland module.";

    sensitivity = lib.mkOption {
      type = lib.types.float;
      default = 0.0;
      description = "Hyprland sensitivity (supports negative numbers).";
      example = -0.5;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland.enable = true;
    programs.hyprland.withUWSM = true;

    home-manager.users.ezt = {
      wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;

        settings = {
          xwayland.force_zero_scaling = true;

          general = {
            gaps_in = 2;
            gaps_out = 5;
          };

          input = {
            kb_layout = "no";

            sensitivity = cfg.sensitivity;

            touchpad = {
              natural_scroll = true;
              disable_while_typing = false;
            };
          };
        };
      };
    };
  };
}
