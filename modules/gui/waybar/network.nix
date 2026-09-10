# modules/gui/waybar/network.nix
{
  den.aspects.waybar.homeManager = _: {
    programs.waybar.settings.main-bar.network = {
      format-wifi = "wifi {bandwidthDownBits}";
      format-ethernet = "eth {bandwidthDownBits}";
      format-disconnected = "no network";
      interval = 5;
      tooltip = false;
      on-click = "nmcli radio wifi $(nmcli radio wifi | grep -q enabled && echo off || echo on)";
    };
  };
}
