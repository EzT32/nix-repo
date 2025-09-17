
{ config, lib, ... }:

let
  cfg = config.modules.shell.bash;
in
{
  options.modules.shell.bash = {
    enable = lib.mkEnableOption "Enable modules bash configuration";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      programs.bash = {
        enable = true;

        initExtra = ''
          [[ -f ~/.profile ]] && . ~/.profile
        '';
      };
    };
  };
}


