{pkgs, ...}: {
  imports = [
    ./common.nix
    ../applications/android-studio.nix
    ../applications/obsidian.nix
  ];
}
