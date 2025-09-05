{ config, lib, ... }:
let
  cfg = config.custom.system.home-manager;
in
{
  options.custom.system.home-manager = {
    enable = lib.mkEnableOption "Enable home-manager configurations.";
  };

  config = lib.mkIf cfg.enable {
    custom.kitty.enable = true;
    custom.rofi.enable = true;
    custom.nvim.enable = true;
    custom.git = {
      enable = true;

      userName = "EzT32";
      userEmail = "theodor.berghansen@icloud.com";
    };

    custom.shell.bash.enable = true;
    custom.shell.eza.enable = true;
    custom.shell.zoxide.enable = true;
    custom.shell.zsh.enable = true;

    home-manager.users.ezt = {
      home.stateVersion = config.system.stateVersion;
      home.username = "ezt";
      home.homeDirectory = "/home/ezt";
      programs.home-manager.enable = true;
    };

    programs.firefox.enable = true;
    nixpkgs.config.allowUnfree = true;
  };
}
