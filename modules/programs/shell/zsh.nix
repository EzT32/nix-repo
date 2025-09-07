{ config, lib, ... }:
let
  cfg = config.modules.shell.zsh;
in
{
  options.modules.shell.zsh = {
    enable = lib.mkEnableOption "Enable modules zsh configuration";
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
