{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.programs.libreoffice;
in
{
  options.custom.programs.libreoffice = {
    enable = lib.mkEnableOption "Enable libreoffice configurations.";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      home.packages = with pkgs; [
        libreoffice
      ];
    };
  };
}
