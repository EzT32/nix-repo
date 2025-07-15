{config, ...}:
let
  path = "${config.home.homeDirectory}/nix-repo/home-manager/wallpapers";
  wallpaper = "NixGruvbox.png";
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
