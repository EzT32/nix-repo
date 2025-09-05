{
  config,
  lib,
  unstable,
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
    home-manager.users.ezt = {
      home.packages = with unstable; [
        (discord.override {
          withOpenASAR = cfg.openASAR;
          withVencord = cfg.vencord;
        })
      ];
    };
  };
}
