# modules/gui/waybar/workspaces.nix
{
  den.aspects.waybar.homeManager = _: {
    programs.waybar.settings.main-bar."hyprland/workspaces" = {
      disable-scroll = true;
      all-outputs = true;
      sort-by = "number";
      tooltip = false;
    };
  };
}
