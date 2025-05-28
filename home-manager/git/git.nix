{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "EzT32";
    userEmail = "theodor.berghansen@icloud.com";
    package = pkgs.gitFull;
    extraConfig = {
      credential.helper = "libsecret";
    };
  };
}
