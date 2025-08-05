{pkgs, ...}:
{
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      GDK_SCALE = "1.5";
      QT_SCALE_FACTOR = "1.5";

      LIBVA_DRIVER_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      WLR_NO_HARDWARE_CURSORS = "1";


      EDITOR = "nvim";
    };

    systemPackages = with pkgs; [
      brightnessctl
      playerctl
    ];
  };
}
