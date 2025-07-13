{...}:
let
  wallpaper = "NixGruvbox.png";
in
{
  imports = [
    ../home.nix
    ../applications/obsidian.nix
    ../python/python.nix
    ../modules/hyprland/hypridle.nix
    ../modules/hyprland/hyprlock.nix
  ];

  my.modules.hypridle = {
    enable = true;
    lockTimeout = 900;
    dpmsTimeout = 900;
  };

  my.modules.hyprlock = {
    enable = true;
    grace = 60;
    wallpaper = "${wallpaper}";
  };
}
