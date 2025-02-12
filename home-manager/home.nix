{ config, pkgs, lib, ... }:
{
  imports = [
    ./hyprland/hyprland.nix
    #./hyprland/swww.nix
    ./shell/shell.nix
    ./git/git.nix
    ./applications/discord.nix
    ./applications/androidStudio.nix 
    ./applications/obsidian.nix
    ./neovim/nixvim.nix
    ./python/python.nix
    #./swayidle.nix
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
    pkgs.steam
    pkgs.minecraft
  ];

  #programs.ncspot.enable = true;
}
