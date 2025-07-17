# profiles/work.nix

{...}:
{
  config.my.modules = {
    hypridle.eanble = true;
    hyprlock.enable = true;
  };

  my.keybinds = {
    enableMedia = true;
    enableMouse = true;
    enableWindow = true;
    enableWorkspace = true;
    enableLaunchers = true;
    enableLaptopExtras = true;
  };
}
