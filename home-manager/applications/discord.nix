{ config, pkgs, lib, ...}:
{
  home.packages = [
    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
  ];
}
