# modules/desktop/waybar/clock.nix
{
  den.aspects.waybar.homeManager = _: {
    programs.waybar.settings.main-bar.clock = {
      format = "{:%H:%M  %a %d %b}";
      tooltip = false;
    };
  };
}
