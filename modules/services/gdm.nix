_: {
  services = {
    xserver = {
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };

      # GDM keyboard layout
      xkb.layout = "no";
    };

    gnome.gnome-keyring.enable = true;
    udisks2.enable = true;
  };
}
