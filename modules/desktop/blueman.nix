{ config, lib, ... }:
let
  cfg = config.modules.startup.blueman;
in
{
  options.modules.startup.blueman = {
    enable = lib.mkEnableOption "Launch blueman on startup.";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      xdg.configFile."autostart/blueman.desktop".text = ''
        [Desktop Entry]
        Hidden=${cfg.enable}
      '';
    };
  };
}
