{pkgs, pkgs_unstable, ...}: {
  imports = [
    ./common.nix
  ];

  home.packages = with pkgs_unstable; [
    prismlauncher
  ];
}
