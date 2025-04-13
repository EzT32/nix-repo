{
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-e14-amd
    ../../modules/steam.nix
  ];

  networking.hostName = "laptop";
  system.stateVersion = "24.11";
}
