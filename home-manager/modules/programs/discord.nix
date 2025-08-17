{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.programs.discord;
in
{
  options.custom.programs.discord = {
    enable = lib.mkEnableOption "Enable discord";

    openASAR = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };

    vencord = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      (discord.override {
        withOpenASAR = cfg.openASAR;
        withVencord = cfg.vencord;
      })
    ];
  };
}
