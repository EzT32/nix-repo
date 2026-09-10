# modules/gui/waybar/audio.nix
{
  den.aspects.waybar.homeManager = _: {
    programs.waybar.settings.main-bar.wireplumber = {
      format = "vol {volume}%";
      format-muted = "muted";
      on-click = "pavucontrol";
      scroll-step = 5;
      max-volume = 150;
      tooltip = false;
    };
  };
}
