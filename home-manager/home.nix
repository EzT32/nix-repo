{ config, pkgs, lib, ... }:
  

{
  imports = [
    ./hyprland/hyprland.nix
    ./hyprland/kitty.nix
    ./hyprland/rofi.nix
    ./hyprland/wayland.nix
    #./hyprland/swww.nix
    ./hyprland/hyprpaper.nix
    ./shell/shell.nix
    ./git/git.nix
    ./discord/discord.nix
    ./android/androidStudio.nix 
  ];

  home.username = "ezt";
  home.homeDirectory = "/home/ezt";

  home.stateVersion = "24.11";

  # Firefox
  programs.firefox = {
    enable = true;
  };
 
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
