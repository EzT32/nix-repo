# profiles/work.nix

{...}:
{
  my.modules = {
    hypridle.enable = true;
    hyprlock.enable = true;
  };

  custom.keybinds = {
    laptop.enable = true;
    launchers.enable = true;
    media.enable = true;
    mouse.enable = true;
    window.enable = true;
    workspace.enable = true;
  };
}
