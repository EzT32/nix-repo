{ pkgs_unstable, ... }:

{
  imports = [
    ../home.nix
    ../modules
  ];

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

  home.packages = with pkgs_unstable; [
    prismlauncher
  ];
}

