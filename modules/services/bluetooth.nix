{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.services.bluetooth;
in
{
  options.modules.services.bluetooth = {
    enable = lib.mkEnableOption "Enable bluetooth";
  };

  config = lib.mkIf cfg.enable {
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;

    environment.systemPackages = with pkgs; [
      blueman
      bluez
    ];
  };
}
