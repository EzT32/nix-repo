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
          "ifi" = {
            hostname = "login.ifi.uio.no";
            user = "theodobe";
            proxyJump = "theodobe@login.uio.no";
            forwardAgent = true;
          };
          "login.uio.no" = {
            user = "theodobe";
          };
        };
      };
    };

    environment.systemPackages = [
      pkgs.xauth
    ];
  };
}
