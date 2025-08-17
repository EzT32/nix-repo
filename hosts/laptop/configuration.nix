{ ... }:
{

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "laptop";
  system.stateVersion = "25.05";
}
