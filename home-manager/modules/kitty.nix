
{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.my.modules.kitty;

  themePath = "${cfg.themeRepo}/themes/${cfg.theme}.conf";
in {
  options.my.modules.kitty = {
    enable = mkEnableOption "Enable Kitty terminal configuration";

    font = {
      name = mkOption {
        type = types.str;
        default = "FiraCode Nerd Font";
        description = "Font name for Kitty";
      };

      size = mkOption {
        type = types.int;
        default = 10;
        description = "Font size for Kitty";
      };
    };

    theme = mkOption {
      type = types.str;
      default = "gruvbox_dark";
      description = "Kitty theme filename (from the kitty-themes repo)";
    };

    themeRepo = mkOption {
      type = types.path;
      default = pkgs.fetchFromGitHub {
        owner = "dexpota";
        repo = "kitty-themes";
        rev = "b1abdd54ba655ef34f75a568d78625981bf1722c";
        sha256 = "sha256-RcDmZ1fbNX18+X3xCqqdRbD+XYPsgNte1IXUNt6CxIA=";
      };
      description = ''
        Optional custom path or fetchFromGitHub derivation pointing to a kitty-themes directory.
        If null, the default 'dexpota/kitty-themes' repo is used.
      '';
    };
  };

  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;

      font = {
        name = cfg.font.name;
        size = cfg.font.size;
      };

      extraConfig = builtins.readFile themePath;

      settings = {
        window_padding_width = 0;
        enable_audio_bell = false;
        linux_display_server = "wayland";
        background_opacity = "0.8";
      };
    };

    home.packages = with pkgs; [
      nerd-fonts.fira-code
    ];
  };
}

