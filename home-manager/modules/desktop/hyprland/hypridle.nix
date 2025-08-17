{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.hyprland.hypridle;
in
{
  options.custom.hyprland.hypridle = {
    enable = lib.mkEnableOption "Enable hypridle service";

    lockTimeout = lib.mkOption {
      type = lib.types.int;
      default = 900;
      description = "Seconds before locking screen";
    };

    dpmsTimeout = lib.mkOption {
      type = lib.types.int;
      default = 900;
      description = "Seconds before turning off display";
    };
  };

  config = lib.mkIf cfg.enable {
    services.hypridle = {
      enable = true;

      settings = {
        general = {
          after_sleep_cmd = "hyprctl dispatch dpms on";
          ignore_dbus_inhibit = false;
          lock_cmd = "hyprlock";
        };

        listener = [
          {
            timeout = cfg.lockTimeout;
            on-timeout = "hyprlock";
          }
          {
            timeout = cfg.dpmsTimeout;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };
}
