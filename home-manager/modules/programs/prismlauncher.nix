{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.programs.prismlauncher;
in
{
  options.custom.programs.prismlauncher = {
    enable = lib.mkEnableOption "Enable prismlauncher";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      prismlauncher
    ];
  };
}
