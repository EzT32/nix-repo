{pkgs, pkgs_unstable, ...}: {
  imports = [
    ../home.nix
  ];

  home.packages = with pkgs_unstable; [
    prismlauncher
  ];
}
