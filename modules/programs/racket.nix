{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.modules.programs.racket;
in
{
  options.modules.programs.racket = {
    enable = lib.mkEnableOption "Enable modules racket configuration.";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      home.packages = with pkgs; [
        racket
      ];
    };
  };
}
