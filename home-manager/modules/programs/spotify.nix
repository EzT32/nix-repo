{config, lib, pkgs, ...}:
let
  cfg = config.custom.programs.spotify;
in {
  options.custom.programs.spotify = {
    enable = lib.mkEnableOption "Enable spotify";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      spotify
    ];
  };
}
