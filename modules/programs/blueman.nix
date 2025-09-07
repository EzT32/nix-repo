{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.programs.blueman;
in
{
  options.modules.programs.blueman = {
    enable = lib.mkEnableOption "Enable bluemand configurations.";
    startup = lib.mkEnableOption "Launch blueman on startup.";
  };

  config = lib.mkIf cfg.enable {
    services.blueman.enable = true;
    
    home-manager.users.ezt = {
      xdg.configFile."autostart/blueman.desktop".text = ''
        [Desktop Entry]
        Hidden=${lib.boolToString (!cfg.startup)}
      '';
    };
  };
}
