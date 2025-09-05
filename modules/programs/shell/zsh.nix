{ config, lib, ... }:
let
  cfg = config.custom.shell.zsh;
in
{
  options.custom.shell.zsh = {
    enable = lib.mkEnableOption "Enable custom zsh configuration";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      programs.zsh = {
        enable = true;

        autosuggestion.enable = true;
        enableCompletion = true;
        sessionVariables = {
          EDITOR = "nvim";
        };
      };
    };
  };
}
