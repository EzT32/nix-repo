_: {
  networking.hostName = "laptop";

  modules = {
    desktop = {
      hyprland = {
        keybinds.laptop.enable = true;
      };
    };

    programs = {
      obsidian.enable = true;
      blueman.enable = true;
    };
  };
}
