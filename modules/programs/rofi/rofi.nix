{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.modules.rofi;
in
{
  options.modules.rofi = {
    enable = lib.mkEnableOption "Enable modules rofi app launcher configuration.";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      programs.rofi = {
        enable = true;

        theme = "gruvbox-dark";

        extraConfig = {
          show-icons = true;
          icon-theme = "breeze";
          drun-display-format = "{name} {icon}";
        };
      };
    };
  };
}
