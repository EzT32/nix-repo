{ config, pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/steam.nix
  ];

  # Nvidia drivers
  hardware.nvidia = {
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
  services.xserver.videoDrivers = ["nvidia"];

  networking.hostName = "desktop";
  system.stateVersion = "25.05";
}
