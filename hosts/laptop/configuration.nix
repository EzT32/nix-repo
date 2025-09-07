_: {
  networking.hostName = "laptop";

  custom = {
    hyprland = {
      hypridle.enable = true;
      keybinds.laptop.enable = true;
    };

    programs = {
      obsidian.enable = true;
      racket.enable = true;
      ghdl.enable = true;
    };
  };
}
