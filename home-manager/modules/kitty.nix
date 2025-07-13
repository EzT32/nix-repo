{...}: {
  programs.kitty = {
    enable = true;
    settings = {
      linux_display_server = "wayland";
      background_opacity = "0.8";
      background = "#000000";
    };
  };
}
