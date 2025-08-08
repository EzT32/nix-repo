{config, lib, ...}:
let
  cfg = config.custom.startup.blueman;
in {
  options.custom.startup.blueman = {
    enable = lib.mkEnableOption "Launch blueman on startup.";
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile."autostart/blueman.desktop".text = ''
      [Desktop Entry]
      Hidden=${cfg.enable}
    '';
  };
}
