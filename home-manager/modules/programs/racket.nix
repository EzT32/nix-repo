{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.custom.programs.racket;
in
{
  options.custom.programs.racket = {
    enable = lib.mkEnableOption "Enable custom racket configuration.";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      racket
    ];
  };
}
