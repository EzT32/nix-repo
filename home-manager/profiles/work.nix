# profiles/work.nix

{...}:
{
  my.modules = {
    hypridle.enable = true;
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
