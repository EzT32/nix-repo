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

          alias os_course='sshfs uio:os_course ~/os_course -o reconnect'
          alias os_course_umount='fusermount -u ~/os_course || umount ~/os_course'

          alias IN3160='sshfs uio:IN3160 ~/uio/v26/IN3160 -o reconnect'
          alias IN3160_umount='fusermount -u ~/uio/v26/IN3160 || umount ~/uio/v26/IN3160'
        '';
      };
    };
  };
}
