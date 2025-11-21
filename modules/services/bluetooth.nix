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
    enable = lib.mkEnableOption "Enable bluetooth configurations.";
  };

  config = lib.mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;

      settings = {
        General = {
          Experimental = true;
          FastConnectable = true;
          Discoverable = false;
          Pairable = false;
        };
      };
    };

    environment.systemPackages = with pkgs; [
      bluez
    ];
  };
}
