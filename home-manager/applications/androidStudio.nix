{ config, pkgs, lib, ...}:
{
  home.packages = [
    pkgs.android-studio
  ];
}
