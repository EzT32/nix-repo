{ config, lib, ... }:
let
  cfg = config.modules.shell.zoxide;
in
{
  options.modules.shell.zoxide = {
    enable = lib.mkEnableOption "Enable modules zoxide configuration";
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
