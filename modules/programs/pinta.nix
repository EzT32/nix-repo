{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.pinta;
in
{
  options.modules.programs.pinta = {
    enable = lib.mkEnableOption "Enable pinta";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      home.packages = with pkgs; [
        pinta
      ];
    };
  };
}
