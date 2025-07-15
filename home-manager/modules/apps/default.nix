{pkgs, pkgs_unstable, ...}:
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
  ];
}
