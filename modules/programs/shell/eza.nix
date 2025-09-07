{ config, lib, ... }:
let
  cfg = config.modules.shell.eza;
in
{
  options.modules.shell.eza = {
    enable = lib.mkEnableOption "Enable modules eza configuration";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      programs.eza = {
        enable = true;
      };
    };
  };
}
