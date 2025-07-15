{lib, ...}: {
  toggleMic = lib.mkOption {
    type = lib.types.str;
    default = "echo toggle mic";
    description = "Command to toggle mic";
  };
}
