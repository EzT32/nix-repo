{lib, config, pkgs, ...}:
let
  cfg = config.custom.programs.syncplay;
in
{
  options.custom.programs.syncplay = {
    enable = lib.mkEnableOption "Enable configuration for syncplay";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      home.packages = with pkgs; [
        syncplay
      ];
    };
  };
}
