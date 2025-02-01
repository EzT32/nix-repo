{ config, pkgs, lib, ... }:
{
  home.packages = [
    pkgs.dolphin

    pkgs.kdePackages.qtwayland
    pkgs.kdePackages.qtsvg
    pkgs.kdePackages.kio-fuse
    pkgs.kdePackages.kio-extras
  ];
  

}
