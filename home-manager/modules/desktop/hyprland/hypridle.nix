{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.my.modules.hypridle;
in {
  options.my.modules.hypridle = {
    enable = mkEnableOption "Enable hypridle service";

    lockTimeout = mkOption {
      type = types.int;
      default = 900;
      description = "Seconds before locking screen";
    };

    dpmsTimeout = mkOption {
      type = types.int;
      default = 900;
      description = "Seconds before turning off display";
    };
  };

  config = mkIf cfg.enable {
    services.hypridle = {
      enable = true;
      package = pkgs.hypridle;

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
