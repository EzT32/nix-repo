{ config, lib, pkgs, ... }:
let
  cfg = config.modules.programs.ssh;
in
{
  options.modules.programs.ssh = {
    enable = lib.mkEnableOption "Enable ssh configurations.";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      services.ssh-agent.enable = true;
      programs.ssh = {
        enable = true;
        enableDefaultConfig = false;

        matchBlocks = {
          "uio" = {
            host = "uio";
            hostname = "login.uio.no";
            user = "theodobe";
            forwardX11 = true;
            forwardX11Trusted = true;
            compression = true;
          };
          "ifi" = {
            host = "ifi";
            hostname = "login.ifi.uio.no";
            user = "theodobe";
            forwardX11 = true;
            forwardX11Trusted = true;
            compression = true;
            proxyJump = "uio";
          };
        };
      };
    };

    environment.systemPackages = [
      pkgs.xauth
    ];
  };
}
