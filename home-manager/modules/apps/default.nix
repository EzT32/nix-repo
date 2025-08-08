{pkgs, ...}:
{
  home.packages = with pkgs; [
    discord
    obsidian
    vlc
    mpv
    spotify
    slurp
    swappy
    prismlauncher
    usbimager
  ];

  xdg.configFile."autostart/blueman.desktop".text = ''
    [Desktop Entry]
    Hidden=true
  '';
}
