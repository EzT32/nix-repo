{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.libreoffice;
in
{
  options.modules.programs.libreoffice = {
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
