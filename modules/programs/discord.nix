{
  config,
  lib,
  unstable,
  ...
}:
let
  cfg = config.modules.programs.discord;
in
{
  options.modules.programs.discord = {
    enable = lib.mkEnableOption "Enable discord";

    openASAR = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };

    vencord = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };

    vesktop = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      home.packages = with unstable; [
        (
          if cfg.vesktop then
            vesktop
          else
            (discord.override {
              withOpenASAR = cfg.openASAR;
              withVencord = cfg.vencord;
            })
        )
      ];
    };
  };
}
