# modules/gui/waybar/memory.nix
{
  den.aspects.waybar.homeManager = _: {
    programs.waybar.settings.main-bar.memory = {
      format = "mem {percentage}%";
      interval = 2;
      tooltip = false;
      states.critical = 80;
    };
  };
}
