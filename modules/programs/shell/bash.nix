{ config, lib, ... }:
let
  cfg = config.custom.shell.bash;
in
{
  options.custom.shell.bash = {
    enable = lib.mkEnableOption "Enable custom bash configuration";
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
