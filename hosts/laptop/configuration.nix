_: {
  networking.hostName = "laptop";

  modules = {
    desktop = {
      hyprland = {
        hypridle.enable = true;
        keybinds.laptop.enable = true;
      };
    };

    programs = {
      obsidian.enable = true;
      racket.enable = true;
      ghdl.enable = true;
      blueman.enable = true;
    };
  };
}
