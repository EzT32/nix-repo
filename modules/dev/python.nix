{ pkgs, ... }:
{
  home-manager.users.ezt = {
    home.packages = with pkgs; [
      (python312.withPackages (python-pkgs: with python-pkgs; [ evdev pygments ]))
      pandoc
      texliveFull
    ];
  };
}
