{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.mpv;
in
{
  options.modules.programs.mpv = {
    enable = lib.mkEnableOption "Enable mpv";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      home.packages = with pkgs; [
        mpv
      ];
    };
  };
}
