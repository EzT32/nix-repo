{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.my.modules.hyprlock;
in {
  options.my.modules.hyprlock = {
    enable = mkEnableOption "Enable hyprlock";

    path = mkOption {
      type = types.path;
      default = "${config.home.homeDirectory}/nix-repo/home-manager/wallpapers";
      description = "Path to the directory containing wallpapers for hyprlock.";
    };

    wallpaper = mkOption {
      type = types.str;
      default = "falcon.jpg";
      description = "Wallpaper file to use for hyprlock background.";
    };

    grace = mkOption {
      type = types.int;
      default = 60;
      description = "Number of seconds grace period before locking again.";
    };
  };

  config = mkIf cfg.enable {
    programs.hyprlock = {
      enable = true;
      package = pkgs.hyprlock;

      settings = {
        general = {
          disable_loading_bar = true;
          grace = cfg.grace;
          hide_cursor = true;
          no_fade_in = false;
        };

        background = [
          {
            path = "${cfg.path}/${cfg.wallpaper}";
            blur_passes = 3;
            blur_size = 8;
          }
        ];

        input-field = [
          {
            size = "200, 50";
            position = "0, -80";
            monitor = "";
            dots_center = true;
            fade_on_empty = false;
            font_color = "rgb(202, 211, 245)";
            inner_color = "rgb(91, 96, 120)";
            outer_color = "rgb(24, 25, 38)";
            outline_thickness = 5;
            placeholder_text = "<span foreground='##cad3f5'>Password...</span>";
            shadow_passes = 2;
          }
        ];
      };
    };
  };
}

