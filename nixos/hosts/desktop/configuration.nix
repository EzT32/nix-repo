{}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/steam.nix
  ];

  networking.hostName = "desktop";
  system.stateVersion = "24.11";
}
