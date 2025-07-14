{pkgs_unstable, ...}:
{
  my.modules.kitty.enable = true;
  #my.modules.dolphin.enable = true;

  imports = [
    ../home.nix
  ];

  home.packages = with pkgs_unstable; [
    prismlauncher
  ];
}
