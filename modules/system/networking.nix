_: {
  networking = {
    networkmanager = {
      enable = true;

      wifi = {
        powersave = false;
        backend = "iwd";
      };
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ];
    };
  };

  programs.mtr.enable = true;
}
