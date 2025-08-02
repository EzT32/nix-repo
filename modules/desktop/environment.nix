{pkgs, ...}:
{
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      GDK_SCALE = "1.5";
      QT_SCALE_FACTOR = "1.5";
    };

    systemPackages = with pkgs; [
      brightnessctl
      playerctl
    ];
  };
}
