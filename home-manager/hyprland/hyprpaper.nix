{ config, ...}:
let
  path = "${config.home.homeDirectory}/nix-repo/home-manager/hyprland/wallpapers";
  wallpaper = "NixWallpaper.png";
in
{
  wayland.windowManager.hyprland.settings = {
    exec-once = ["hyprpaper"];
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["${path}/${wallpaper}"];
      wallpaper = [",${path}/${wallpaper}"];
    };
  };
}
