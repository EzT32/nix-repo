{ config, pkgs, lib, ... }:
{
  home.packages = [
    pkgs.kdePackages.dolphin

    # Core dependencies for Dolphin
    pkgs.kdePackages.qtwayland
    pkgs.kdePackages.qtsvg
    pkgs.kdePackages.kio-fuse
    pkgs.kdePackages.kio-extras
    pkgs.kdePackages.kdegraphics-thumbnailers

    # Nordic KDE Theme
    pkgs.nordic

    # Recommended extras for better appearance
    pkgs.kdePackages.frameworkintegration  # Ensures KDE apps blend well
    pkgs.kdePackages.kiconthemes  # Ensures icon theming works properly
    pkgs.libsForQt5.qtstyleplugins  # Extra Qt style plugins

    # Kvantum and required dependencies
    pkgs.libsForQt5.qtstyleplugin-kvantum  # Kvantum theme engine
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "kde";
    XDG_CURRENT_DESKTOP = "KDE";
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    KDE_FULL_SESSION = "true";

    # Apply the Nordic theme
    QT_STYLE_OVERRIDE = "kvantum";  # Ensures Qt apps follow Kvantum styling
  };
  

}
