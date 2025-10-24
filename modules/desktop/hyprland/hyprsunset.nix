# https://search.nixos.org/options?channel=25.05&query=systemd.user.services
{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.modules.desktop.hyprland.hyprsunset;
  pkill-bin = "${pkgs.procps}/bin/pkill";
  systemd-run = "systemd-run --user --scope --quiet";
  bash-bin = "${pkgs.bash}/bin/bash";
  hyprsunset-bin = "${pkgs.hyprsunset}/bin/hyprsunset";
in
{
  options.modules.desktop.hyprland.hyprsunset = {
    enable = lib.mkEnableOption "Enable hyprsunset service.";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      hyprsunset
    ];

    home-manager.users.ezt = {
      wayland.windowManager.hyprland.settings = {
        bindl = [
          "SUPERSHIFT, n, exec, ${pkill-bin} hyprsunset; ${hyprsunset-bin} -t 4500 &"
          "SUPERSHIFT, d, exec, ${pkill-bin} hyprsunset; ${hyprsunset-bin} -i &"
        ];
      };
    };

    systemd.user.services.nightlight = {
      description = "Custom hyprsunset service";
      wantedBy = [ "graphical-session.target" ];

      serviceConfig = {
        KillMode = "mixed";
        Type = "oneshot";
      };

      script = ''
        time=$(date +%H%M%S)
        ${pkill-bin} hyprsunset || true
        if [ "$time" -ge 220000 -o "$time" -le 080000 ]; then
          ${systemd-run} ${bash-bin} -c "${hyprsunset-bin} -t 4500 &"
        else
           ${systemd-run} ${bash-bin} -c "${hyprsunset-bin} -i &"
        fi
      '';
    };

    systemd.user.timers.hyprsunset-day = {
      description = "Restart hyprsunset for daytime";
      timerConfig = {
        OnCalendar = "*-*-* 08:00:00";
        Unit = "nightlight.service";
        Persistent = true;
      };
      wantedBy = [ "timers.target" ];
    };

    systemd.user.timers.hyprsunset-night = {
      description = "Restart hyprsunset for nighttime";
      timerConfig = {
        OnCalendar = "*-*-* 22:00:00";
        Unit = "nightlight.service";
        Persistent = true;
      };
      wantedBy = [ "timers.target" ];
    };
  };
}
