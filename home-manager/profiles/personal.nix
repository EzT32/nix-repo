{config, pkgs, pkgs_unstable, ...}:
let
  wallpaper = "NixGruvbox.png";
in
{
  imports = [
    ../home.nix
  ];

  home.packages = with pkgs_unstable; [
    prismlauncher
  ];
}
