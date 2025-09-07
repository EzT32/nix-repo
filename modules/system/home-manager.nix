{ config, lib, ... }:
let
  cfg = config.modules.system.home-manager;
in
{
  options.modules.system.home-manager = {
    enable = lib.mkEnableOption "Enable home-manager configurations.";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      home = {
        stateVersion = config.system.stateVersion;
        username = "ezt";
        homeDirectory = "/home/ezt";
      };
    };
  };
}
