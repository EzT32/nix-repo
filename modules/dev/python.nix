{ pkgs, ... }:
{
  home-manager.users.ezt = {
    home.packages = with pkgs; [
      (python3.withPackages (
        python-pkgs: with python-pkgs; [
          evdev
          pyaml
        ]
      ))
      pandoc
      texliveFull
    ];
  };
}
