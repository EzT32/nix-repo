{pkgs, ...}: {
  imports = [
    ../hyprland/hyprland.nix
    ../shell/shell.nix
    ../git/git.nix
    ../applications/discord.nix
    ../nvim/nvim.nix
    ../python/python.nix
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
    pkgs.grim
    pkgs.slurp
    pkgs.swappy
  ];
}
