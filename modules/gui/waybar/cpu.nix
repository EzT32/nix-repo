# modules/gui/waybar/cpu.nix
{
  den.aspects.waybar.homeManager = _: {
    programs.waybar.settings.main-bar.cpu = {
      format = "cpu {usage}%";
      interval = 2;
      tooltip = false;
      states.critical = 90;
    };
  };
}
