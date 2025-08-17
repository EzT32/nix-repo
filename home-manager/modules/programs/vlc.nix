{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.programs.vlc;
in
{
  options.custom.programs.vlc = {
    enable = lib.mkEnableOption "Enable vlc";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      vlc
    ];
  };
}
