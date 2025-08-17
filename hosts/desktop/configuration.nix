{ config, ... }:
{

  nixpkgs.config.allowUnfree = true;

  # Nvidia drivers
  hardware.nvidia = {
    open = false;

    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
  services.xserver.videoDrivers = [ "nvidia" ];

  # boot.kernelParams = [ "nvidia_drm.modeset=1" ];
  # boot.extraModprobeConfig = ''
  #  options nvidia_drm modeset=1
  #'';

  # services.xserver.displayManager.gdm.wayland = true;

  networking.hostName = "desktop";
  system.stateVersion = "25.05";
}
