{pkgs, ...}: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extest.enable = true;

    package = pkgs.steam.override {
      extraEnv.MANGOHUD = true;
      extraPkgs = pkgs: [pkgs.mangohud];
    };
  };
}
