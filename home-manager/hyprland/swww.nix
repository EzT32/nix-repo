{ config, pkgs, lib, ...}:
let
  path = "${config.home.homeDirectory}/nix-repo/home-manager/hyprland/wallpapers";
  wallpaper = "falcon.jpg";
in
{
  home.packages = [
    pkgs.swww
  ];
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "swww-daemon &"
      "sleep 0.5 && swww img ${path}/${wallpaper}"
    ];
  };
}
