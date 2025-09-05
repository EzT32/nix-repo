{ config, lib, ... }:
let
  cfg = config.custom.shell.zoxide;
in
{
  options.custom.shell.zoxide = {
    enable = lib.mkEnableOption "Enable custom zoxide configuration";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      programs.zoxide = {
        enable = true;
        options = [ "--cmd cd" ];
      };
    };
  };
}
