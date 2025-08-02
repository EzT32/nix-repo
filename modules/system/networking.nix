{...}:
{
  services.dnsmasq = {
    enable = true;
    settings = {
      server = [ "8.8.8.8" "1.1.1.1" ];
    };
  };
  
  networking = {
    networkmanager.enable = true;
    wireless.iwd.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 5555 ];
    };
  };

  programs.mtr.enable = true;
}
