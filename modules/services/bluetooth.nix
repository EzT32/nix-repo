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
      powerOnBoot = true;

      settings = {
        General = {
          Experimental = true;
          FastConnectable = true;
        };
      };
    };

    environment.systemPackages = with pkgs; [
      bluez
    ];
  };
}
