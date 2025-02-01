{ config, pkgs, lib, ... }:
{
  services.swayidle = {
    enable = true;
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
      { event = "lock"; command = "lock"; }
    ];
    timeouts = [
      { timeout = 120; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
      { timeout = 300; command = "${pkgs.systemd}/bin/systemctl suspend"; } 
    ];
    package = pkgs.swayidle;
  };

  programs.swaylock.enable = true;
  programs.swaylock.package = pkgs.swaylock;
  programs.swaylock.settings = {
  color = "211e20";
  };

  home.packages = [
    pkgs.swayidle
  ];
}
