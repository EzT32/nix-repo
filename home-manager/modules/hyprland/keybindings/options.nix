{lib, ...}:
{
  options.my.keybinds = {
    enableLaptopExtras = lib.mkEnableOption "Enable laptop-specific keybinds";
    enableLaunchers = lib.mkEnableOption "Enable launcher keybinds";
    enableMedia = lib.mkEnableOption "Enable media bindings";
    enableMouse = lib.mkEnableOption "Enable mouse bindings";
    enableWindow = lib.mkEnableOption "Enable window management bindings";
    enableWorkspace = lib.mkEnableOption "Enable workspace bindings";
          
    toggleAudio = lib.mkOption {
      type = lib.types.str;
      default = "echo toggle audio";
      description = "Command to toggle audio";
    };

    toggleMic = lib.mkOption {
      type = lib.types.str;
      default = "echo toggle mic";
      description = "Command to toggle mic";
    };

    updateMicLed = lib.mkOption {
      type = lib.types.str;
      default = "echo update mic led";
      description = "Command to update mic LED";
    };
  };
}
