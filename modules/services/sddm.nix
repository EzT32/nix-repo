_: {
  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    xserver.xkb = {
      layout = "no";
      variant = "";
    }; 

    gnome.gnome-keyring.enable = true;
    udisks2.enable = true;
  };
}
