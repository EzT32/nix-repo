{...}:
{
  hardware.bluetooth.enable = true;

  xdg.configFile."autostart/blueman.desktop".text = ''
    [Desktop Entry]
    Hidden=true
  '';

  services.blueman.enable = true;
}
