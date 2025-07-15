# profiles/default.nix

{...}:
{
  imports = [ ../modules ];

  my.modules.kitty.enable = true;

  # Enable specific keybind sets
  my.keybinds = {
    enableMedia = true;
    enableMouse = true;
    enableWindow = true;
    enableWorkspace = true;
    enableLaunchers = true;
    enableLaptopExtras = true;
  };

  home.username = "ezt";
  home.homeDirectory = "/home/ezt";

  home.stateVersion = "24.11";

  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
