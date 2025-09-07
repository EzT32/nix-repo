{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.programs.ghdl;
in
{
  options.modules.programs.ghdl = {
    enable = lib.mkEnableOption "Enable configuration for ghdl.";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      home.packages = with pkgs; [
        ghdl
        gtkwave
      ];
    };
  };
}
