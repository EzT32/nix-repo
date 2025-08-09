# profiles/default.nix

{profile, ...}:
let
  profileModule = ./. + "/${profile}.nix";
in 
{
  imports = [ profileModule ];

  custom.kitty.enable = true;
  custom.rofi.enable = true;

  home.username = "ezt";
  home.homeDirectory = "/home/ezt";

  home.stateVersion = "25.05";

  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
