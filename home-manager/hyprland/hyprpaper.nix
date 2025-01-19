{ config, pkgs, lib, ...}:
let
  path = "${config.home.homeDirectory}/nix-repo/home-manager/hyprland/wallpapers";
  wallpaper = "falcon.jpg";
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
