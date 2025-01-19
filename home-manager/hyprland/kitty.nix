{ config, pkgs, lib, ...}:
{
  programs.kitty = {
    enable = true;
    settings.linux_display_server = "wayland";
  };
}
