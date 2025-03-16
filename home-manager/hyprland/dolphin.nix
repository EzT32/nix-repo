{pkgs, ...}: {
  home.packages = with pkgs; [
    kdePackages.dolphin

    # Core dependencies for Dolphin
    kdePackages.qtwayland
    kdePackages.qtsvg
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.kdegraphics-thumbnailers

    # Nordic KDE Theme
    nordic

    pipewire
    wireplumber

    # Recommended extras for better appearance
    kdePackages.frameworkintegration # Ensures KDE apps blend well
    kdePackages.kiconthemes # Ensures icon theming works properly
    libsForQt5.qtstyleplugins # Extra Qt style plugins

    # Kvantum and required dependencies
    #qt6ct # Qt6 Configuration Tool
    libsForQt5.qtstyleplugin-kvantum # Kvantum engine for Qt5
    qt6Packages.qtstyleplugin-kvantum # Kvantum engine for Qt6
    kdePackages.breeze-icons
  ];

  xdg.configFile."kdeglobals".text = ''
    [Icons]
    Theme=Breeze
  '';

  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=Nordic
  '';

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct"; # Ensures Qt5 apps use qt5ct
    QT_STYLE_OVERRIDE = "kvantum"; # Forces Kvantum as the style
    XDG_CURRENT_DESKTOP = "KDE"; # Helps Qt apps detect settings
    KDE_FULL_SESSION = "true"; # Needed for proper KDE app theming
  };
}
