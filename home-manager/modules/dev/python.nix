{ pkgs, config, ... }:

{
  # Packages
  home.packages = with pkgs; [
    (python311.withPackages (python-pkgs: with python-pkgs; [ evdev ]))
    pandoc
    texliveFull
  ];
}
