_: {
  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    xserver = {
      layout = "no";
      xkbVariant = "";
    }; 

    gnome.gnome-keyring.enable = true;
    udisks2.enable = true;
  };
}
