{ ... }:
{
  nixpkgs.config.allowUnfree = true;

  custom = {
    hyprland = {
      enable = true;

      hyprpaper.enable = true;
      hypridle.enable = true;

      keybinds = {
        laptop.enable = true;
        launchers.enable = true;
        media.enable = true;
        mouse.enable = true;
        window.enable = true;
        workspace.enable = true;
      };
    };

    cursor = {
      enable = true;
    };

    system.home-manager.enable = true;
    programs = {
      discord.enable = true;
      mpv.enable = true;
      obsidian.enable = true;
      spotify.enable = true;
      racket.enable = true;
      ghdl.enable = true;
    };
  };

  networking.hostName = "laptop";
  system.stateVersion = "25.05";
}
