{ pkgs, ... }:
{
  home-manager.users.ezt = {
    home.packages = with pkgs; [
      (python311.withPackages (python-pkgs: with python-pkgs; [ evdev ]))
      pandoc
      texliveFull
    ];
  };
}
