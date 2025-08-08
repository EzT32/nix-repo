{config, lib, pkgs, ...}:
let
  cfg = config.custom.programs.mpv;
in {
  options.custom.programs.mpv = {
    enable = lib.mkEnableOption "Enable mpv";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      mpv
    ];
  };
}
