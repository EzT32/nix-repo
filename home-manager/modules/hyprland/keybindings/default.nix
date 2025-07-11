{lib, ...}:
{
  imports = [
    ./launchers.nix
    ./mouse.nix
    ./window.nix
    ./laptop.nix
    ./media.nix
    ./workspace.nix
  ];

  options.my.keybinds = {
    enableLaptopExtras = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable laptop-specific keybinds";
    };

    enableLaunchers = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable launchers keybinds";
    };
    
    enableMedia = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable media bindings";
    };

    enableMouse = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable mouse bindings";
    };

    enableWindow = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable window management bindings";
    };

    enableWorkspace = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable workspace bindings";
    };



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
