{pkgs, ...}: {
  imports = [
    ./hyprland/hyprland.nix
    ./shell/shell.nix
    ./git/git.nix
    ./applications/discord.nix
    ./applications/android-studio.nix
    ./applications/obsidian.nix
    ./nvim/nvim.nix
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
    pkgs.steam
    pkgs.grim # Takes screenshots
    pkgs.slurp # Selects a region
    pkgs.swappy # Annotates screenshots
  ];
}
