{ lib, ... }:
{
  options.my.keybinds = {
    enableLaptopExtras = lib.mkEnableOption "Enable laptop-specific keybinds";
    enableLaunchers = lib.mkEnableOption "Enable launcher keybinds";
    enableMedia = lib.mkEnableOption "Enable media bindings";
    enableMouse = lib.mkEnableOption "Enable window management bindings";
    enableWindow = lib.mkEnableOption "Enable window management bindings";
    enableWorkspace = lib.mkEnableOption "Enable workspace bindings";
  };
}
