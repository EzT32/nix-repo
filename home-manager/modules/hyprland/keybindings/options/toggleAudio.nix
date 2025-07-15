{lib, ...}: {
  toggleAudio = lib.mkOption {
    type = lib.types.str;
    default = "echo toggle audio";
    description = "Command to toggle audio";
  };
}
