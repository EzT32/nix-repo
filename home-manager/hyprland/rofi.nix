{ config, pkgs, lib, ... }:
{
  # Rofi-wayland
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };
}

