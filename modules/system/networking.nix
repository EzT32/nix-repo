{ ... }:
{
  networking = {
    networkmanager = {
      enable = true;

      wifi = {
        powersave = false;
        backend = "iwd";
      };
    };
    wireless.iwd.enable = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ];
    };
  };

  programs.mtr.enable = true;
}
