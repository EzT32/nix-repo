{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.modules.desktop.hyprland.hyprsunset;
in
{
  options.modules.desktop.hyprland.hyprsunset = {
    enable = lib.mkEnableOption "Enable hyprsunset service.";

    dayTime = lib.mkOption {
      type = lib.types.str;
      default = "07:30";
      description = "Time to enable daytime color profile.";
    };

    nightTime = lib.mkOption {
      type = lib.types.str;
      default = "21:00";
      description = "Time to enable nighttime color profile.";
    };

    nightTemp = lib.mkOption {
      type = lib.types.int;
      default = 4500;
      description = "Night color temperature.";
    };

    gamma = lib.mkOption {
      type = lib.types.int;
      default = 100;
      description = "Gamma value for nighttime.";
    };

    user = lib.mkOption {
      type = lib.types.str;
      default = "ezt";
      description = "Username for home-manager configuration.";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${cfg.user} =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.hyprsunset ];

        systemd.user.services.hyprsunset-day = {
          Unit = {
            Description = "Set Hyprsunset Daytime Profile";
          };
          Service = {
            ExecStart = "${pkgs.hyprsunset}/bin/hyprsunset -t 6000 -g 100";
          };
        };

        systemd.user.services.hyprsunset-night = {
          Unit = {
            Description = "Set Hyprsunset Nighttime Profile";
          };
          Service = {
            ExecStart = "${pkgs.hyprsunset}/bin/hyprsunset -t ${toString cfg.nightTemp} -g ${toString cfg.gamma}";
          };
        };

        systemd.user.timers.hyprsunset-day = {
          Unit.Description = "Enable daytime profile at ${cfg.dayTime}";
          Timer = {
            OnCalendar = "*-*-* ${cfg.dayTime}";
            Persistent = true;
          };
          Install.WantedBy = [ "timers.target" ];
        };

        systemd.user.timers.hyprsunset-night = {
          Unit.Description = "Enable nighttime profile at ${cfg.nightTime}";
          Timer = {
            OnCalendar = "*-*-* ${cfg.nightTime}";
            Persistent = true;
          };
          Install.WantedBy = [ "timers.target" ];
        };

        wayland.windowManager.hyprland.settings = {
          bindl = [
            # Toggle between day and night manually
            "SUPER, Y, exec, ${pkgs.writeShellScriptBin "toggle-hyprsunset" ''
              if pgrep -x hyprsunset >/dev/null; then
                pkill hyprsunset
                ${pkgs.hyprsunset}/bin/hyprsunset -t 6000 -g 100 &
              else
                ${pkgs.hyprsunset}/bin/hyprsunset -t ${toString cfg.nightTemp} -g ${toString cfg.gamma} &
              fi
            ''}/bin/toggle-hyprsunset"
          ];
        };
      };
  };
}
