{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.modules.desktop.dolphin;
in
{
  options.modules.desktop.dolphin = {
    enable = lib.mkEnableOption "Enable dolphin configurations.";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      kdePackages.dolphin
      kdePackages.qtsvg
    ];
  };
}
