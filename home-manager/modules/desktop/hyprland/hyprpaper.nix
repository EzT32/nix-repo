{ lib, config, ... }:
let
  cfg = config.custom.hyprland.hyprpaper;
in
{
  options.custom.hyprland.hyprpaper = {
    enable = lib.mkEnableOption "Enable custom hyprpaper module.";

    path = lib.mkOption {
      type = lib.types.path;
      default = "${config.home.homeDirectory}/nix-repo/home-manager/wallpapers";
      description = "Path to the directory containing wallpapers for hyprpaper.";
      example = "~/path/to/wallpaper/folder";
    };

    wallpaper = lib.mkOption {
      type = lib.types.str;
      default = "NixGruvbox.png";
      description = "Wallpaper file to use for hyprlock backbround.";
      example = "Wallpaper.png";
    };
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
      exec-once = [ "hyprpaper" ];
    };

    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [ "${cfg.path}/${cfg.wallpaper}" ];
        wallpaper = [ ",${cfg.path}/${cfg.wallpaper}" ];
      };
    };
  };
}
