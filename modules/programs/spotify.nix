{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.spotify;
in
{
  options.modules.programs.spotify = {
    enable = lib.mkEnableOption "Enable spotify";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      home.packages = with pkgs; [
        spotify
      ];
    };
  };
}
