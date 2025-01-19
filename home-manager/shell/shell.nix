{ config, pkgs, lib, ...}:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
  };

  programs.bash.enable = true;
  programs.eza.enable = true;
  programs.zoxide = {
    enable = true;
    options = ["--cmd cd"];
  };
}
