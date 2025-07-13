{pkgs, ...}: let
  cursorTheme = "Bibata-Modern-Ice";
  cursorSize = 8;
in {
  imports = [
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./keybindings
    ../rofi.nix
    ../dolphin.nix
    ../waybar/waybar.nix
    ../kitty.nix

  ];

  home.pointerCursor = {
    hyprcursor = {
      enable = true;
      size = cursorSize;
    };
    name = cursorTheme;
    package = pkgs.bibata-cursors; # Ensure this matches your chosen theme
    size = cursorSize;
    x11.enable = true; # Enable for X11 fallback
    gtk.enable = true; # Enable for GTK apps
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = cursorTheme;
      package = pkgs.bibata-cursors;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      xwayland.force_zero_scaling = true;

      general = {
        gaps_in = 2;
        gaps_out = 5;
      };

      input = {
        kb_layout = "no";

        touchpad = {
          natural_scroll = true;
          disable_while_typing = false;
        };

        sensitivity = -0.5;
      };
    };
  };
}
