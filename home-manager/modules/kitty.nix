{...}: {
  programs.kitty = {
    enable = true;
    settings = {
      linux_display_server = "wayland";
      background_opacity = "0.9";
      background = "#000000";
    };
  };
}
