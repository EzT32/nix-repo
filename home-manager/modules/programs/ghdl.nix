{ pkgs, lib, config, ... }:
let
  cfg = config.custom.programs.ghdl;
in
{
  options.custom.programs.ghdl = {
    enable = lib.mkEnableOption "Enable configuration for ghdl.";
  };

  config = lib.mkIf cfg.enable {
    
    home.packages = with pkgs; [
      ghdl
      gtkwave
    ];
  };
}
