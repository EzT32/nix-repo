{ config, pkgs, lib, ...}:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs.bash = {
    enable = true;
    initExtra = ''
      [[ -f ~/.profile ]] && . ~/.profile
    '';
  };

  programs.eza.enable = true;
  programs.zoxide = {
    enable = true;
    options = ["--cmd cd"];
  };
}
