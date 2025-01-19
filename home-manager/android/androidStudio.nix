{ config, pkgs, lib, ...}:
{
  home.packages = [
    pkgs.androidStudio
  ];
}
