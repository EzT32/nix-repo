{lib, config, ...}:
let
  cfg = config.custom.rofi;
in {
  options.custom.rofi = {
    enable = lib.mkEnableOption "Enable custom rofi app launcher configuration.";
  };

  config = lib.mkIf cfg.enable {
    programs.rofi = {
      enable = true; 
    };
  };
}
