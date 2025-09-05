{ config, lib, ... }:
let
  cfg = config.custom.system.home-manager;
in
{
  options.custom.system.home-manager = {
    enable = lib.mkEnableOption "Enable home-manager configurations.";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      home.stateVersion = config.system.stateVersion;
      home.username = "ezt";
      home.homeDirectory = "/home/ezt";
      programs.home-manager.enable = true;
    };
  };
}
