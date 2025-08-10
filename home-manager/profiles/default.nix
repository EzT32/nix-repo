{profile, ...}: let
  profileModule = ./. + "/${profile}.nix";
in {
  imports = [profileModule];

  custom = {
    kitty.enable = true;
    rofi.enable = true;

    shell = {
      bash.enable = true;
      zsh.enable = true;
      eza.enable = true;
      zoxide.enable = true;
    };

    nvim = {
      enable = true;
    };

    git = {
      enable = true;

      userName = "EzT32";
      userEmail = "theodor.berghansen@icloud.com";
    };
  };

  home = {
    username = "ezt";
    homeDirectory = "/home/ezt";
    stateVersion = "25.05";
  };

  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
