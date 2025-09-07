_: {
  nixpkgs.config.allowUnfree = true;
  programs.firefox.enable = true;

  system.stateVersion = "25.05";

  custom = {
    cursor.enable = true;
    kitty.enable = true;
    nvim.enable = true;
    rofi.enable = true;
    system.home-manager.enable = true;

    git = {
      enable = true;

      userName = "EzT32";
      userEmail = "theodor.berghansen@icloud.com";
    };

    hyprland = {
      enable = true;

      hyprpaper.enable = true;

      keybinds = {
        launchers.enable = true;
        media.enable = true;
        mouse.enable = true;
        window.enable = true;
        workspace.enable = true;
      };
    };

    programs = {
      discord.enable = true;
      mpv.enable = true;
      spotify.enable = true;
    };

    shell = {
      bash.enable = true;
      eza.enable = true;
      zoxide.enable = true;
      zsh.enable = true;
    };
  };
}
