{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extest.enable = true;

    package = pkgs.steam.override {
      extraEnv = {
        MANGOHUD = true;
        STEAM_FORCE_DESKTOPUI_SCALING = "1";
        STEAM_SCALE = "0.75";
      };
      extraPkgs = pkgs: [ pkgs.mangohud ];
    };
  };
}
