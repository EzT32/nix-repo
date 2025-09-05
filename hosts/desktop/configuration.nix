{ config, ... }:
{

  nixpkgs.config.allowUnfree = true;

  # Nvidia drivers
  hardware.nvidia = {
    open = false;

    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
  services.xserver.videoDrivers = [ "nvidia" ];

  custom = {
    hyprland = {
      enable = true;

      hyprpaper.enable = true;

      sensitivity = -0.5;

      keybinds = {
        launchers.enable = true;
        media.enable = true;
        mouse.enable = true;
        window.enable = true;
        workspace.enable = true;
      };
    };

    cursor = {
      enable = true;
    };

    system.home-manager.enable = true;
    programs = {
      discord.enable = true;
      prismlauncher.enable = true;
      spotify.enable = true;
      mpv.enable = true;
      syncplay.enable = true;
      libreoffice.enable = true;
      steam.enable = true;
    };
  };

  networking.hostName = "desktop";
  system.stateVersion = "25.05";
}
