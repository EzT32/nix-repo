{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.kitty;

  themePath = "${cfg.themeRepo}/themes/${cfg.theme}.conf";
in
{
  options.custom.kitty = {
    enable = lib.mkEnableOption "Enable Kitty terminal configuration";

    font = {
      name = lib.mkOption {
        type = lib.types.str;
        default = "FiraCode Nerd Font";
        description = "Font name for Kitty";
      };

      size = lib.mkOption {
        type = lib.types.int;
        default = 10;
        description = "Font size for Kitty";
      };
    };

    theme = lib.mkOption {
      type = lib.types.str;
      default = "gruvbox_dark";
      description = "Kitty theme filename (from the kitty-themes repo)";
    };

    themeRepo = lib.mkOption {
      type = lib.types.path;
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

  config = lib.mkIf cfg.enable {
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
