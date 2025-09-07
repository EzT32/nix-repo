{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.vlc;
in
{
  options.modules.programs.vlc = {
    enable = lib.mkEnableOption "Enable vlc";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      home.packages = with pkgs; [
        vlc
      ];
    };
  };
}
