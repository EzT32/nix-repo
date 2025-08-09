{ ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    style = ./style.css;

    settings.main-bar = {
      layer = "top";
      spacing = 0;
      height = 0;

      margin-top = 0;
      margin-right = 0;
      margin-bottom = 0;
      margin-left = 0;

      modules-left = [ "sway/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [
        "tray"
        "cpu_text"
        "cpu"
        "memory"
        "battery"
        "network"
        "pulseaudio"
      ];

      "sway/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
        tooltip = false;
      };

      tray = {
        spacing = 10;
        tooltip = false;
      };

      clock = {
        format = "{:%H:%M - %a, %d %b %Y}";
        tooltip = false;
      };

      cpu = {
        format = "cpu {usage}%";
        interval = 2;
        states = { critical = 90; };
      };

      memory = {
        format = "mem {percentage}%";
        interval = 2;
        states = { critical = 80; };
      };

      battery = {
        format = "bat {capacity}%";
        interval = 5;
        states = {
          warning = 20;
          critical = 10;
        };
        tooltip = false;
      };

      network = {
        format-wifi = "wifi {bandwidthDownBits}";
        format-ethernet = "enth {bandwidthDownBits}";
        format-disconnected = "no network";
        format-no-carrier = "no Network";
        interval = 5;
        tooltip = false;
        on-click = "nmcli radio wifi $(nmcli radio wifi | grep -q 'enabled' && echo off || echo on)";
      };

      pulseaudio = {
        scroll-step = 5;
        max-volume = 150;
        format = "vol {volume}%";
        format-bluetooth = "vol {volume}%";
        nospacing = 1;
        on-click = "pavucontrol";
        tooltip = false;
      };
    };
  };
}

