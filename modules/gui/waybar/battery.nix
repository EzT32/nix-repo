# modules/gui/waybar/battery.nix
{
  den.aspects.waybar.homeManager = _: {
    programs.waybar.settings.main-bar.battery = {
      format = "bat {capacity}%";
      interval = 5;
      tooltip = false;
      states = {
        warning = 20;
        critical = 10;
      };
    };
  };
}
