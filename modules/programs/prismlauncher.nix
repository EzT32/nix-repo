{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.prismlauncher;
in
{
  options.modules.programs.prismlauncher = {
    enable = lib.mkEnableOption "Enable prismlauncher";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      home.packages = with pkgs; [
        prismlauncher
      ];
    };
  };
}
