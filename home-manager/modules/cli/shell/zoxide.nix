{ config, lib, ... }:
let
  cfg = config.custom.shell.zoxide;
in
{
  options.custom.shell.zoxide = {
    enable = lib.mkEnableOption "Enable custom eza configuration";
  };

  config = lib.mkIf cfg.enable {
    programs.zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
    };
  };
}
