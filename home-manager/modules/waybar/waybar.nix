{ config, pkgs, lib, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
 
  home.file = {
    ".config/waybar/config".source = ./config;
    ".config/waybar/style.css".source = ./style.css;
  };
}

