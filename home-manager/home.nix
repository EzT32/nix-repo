{ config, pkgs, lib, ... }:
{
  imports = [
    ./hyprland/hyprland.nix
    ./hyprland/kitty.nix
    ./hyprland/rofi.nix
    ./hyprland/waybar/waybar.nix
    #./hyprland/swww.nix
    ./hyprland/hyprpaper.nix
    ./shell/shell.nix
    ./git/git.nix
    ./discord/discord.nix
    ./android/androidStudio.nix 
    ./obsidian/obsidian.nix
    ./neovim/nixvim.nix
    ./python/python.nix
  ];

  home.username = "ezt";
  home.homeDirectory = "/home/ezt";

  home.stateVersion = "24.11";

  # Firefox
  programs.firefox = {
    enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.spotify
  ];

  #programs.ncspot.enable = true;
}
