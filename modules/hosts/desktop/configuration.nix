# modules/hosts/desktop/configuration.nix
{ den, ... }:
{
  den.aspects.desktop = {
    nixos = { ... }: {
      networking.hostName = "desktop";
      imports = [ ./_hardware-configuration.nix ];

      powerManagement.cpuFreqGovernor = "performance";
      boot.kernelParams = [ "mitigations=off" ];
    };

    includes = with den.aspects; [
      wooting
      steam
      lact
      prismlauncher
      syncplay
    ];
  };
}
