{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.desktop.hyprland.hyprsunset;
  pkill-bin = "${pkgs.procps}/bin/pkill";
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
          "SUPERSHIFT, n, exec, ${pkill-bin} hyprsunset; ${hyprsunset-bin} -t 4500"
        ];
      };
    };

    systemd.user.services.hyprsunset-autostart = {
      description = "Autodetect Hyprsunset mode at login";
      wantedBy = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = ''
          time=$(date +%H%M)
          if [ "$time" -ge 2200 ] || [ "$time" -lt 800 ]; then
            ${pkgs.systemd}/bin/systemctl --user start hyprsunset-warm.service
          else
            ${pkgs.systemd}/bin/systemctl --user start hyprsunset-cold.service
          fi
        '';
      };
    };

    systemd.user.services.hyprsunset-warm = {
      description = "Hyprsunset warm mode";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = ''
          ${pkgs.procps}/bin/pkill hyprsunset || true
          ${pkgs.hyprsunset}/bin/hyprsunset -t 4500
        '';
      };
    };

    systemd.user.services.hyprsunset-cold = {
      description = "Hyprsunset cold mode";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = ''
          ${pkgs.procps}/bin/pkill hyprsunset || true
          ${pkgs.hyprsunset}/bin/hyprsunset -i
        '';
      };
    };
    systemd.user.timers.hyprsunset-night = {
      description = "Switch Hyprsunset to warm mode at night";
      timerConfig = {
        OnCalendar = "*-*-* 22:00:00";
        Unit = "hyprsunset-warm.service";
        Persistent = true;
      };
      wantedBy = [ "timers.target" ];
    };

    systemd.user.timers.hyprsunset-day = {
      description = "Switch Hyprsunset to cold mode in the morning";
      timerConfig = {
        OnCalendar = "*-*-* 08:00:00";
        Unit = "hyprsunset-cold.service";
        Persistent = true;
      };
      wantedBy = [ "timers.target" ];
    };
  };
}
