{pkgs, ...}: let
  toggle_mic = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
  mic_status = "wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -c MUTED";
  update_mic_led = "brightnessctl -d platform::micmute set $(${mic_status})";

  cursorTheme = "Bibata-Modern-Ice";
  cursorSize = 24;
in {
  imports = [
    ./kitty.nix
    ./hyprpaper.nix
    ./rofi.nix
    ./dolphin.nix
    ./waybar/waybar.nix
    ./hypridle.nix
    ./hyprlock.nix
  ];

  home.pointerCursor = {
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

  xdg.configFile."gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-cursor-theme-name=${cursorTheme}
    gtk-cursor-theme-size=${toString cursorSize}
    gtk-xft-dpi=98304
  '';

  wayland.windowManager.hyprland.settings = {
    # Ensure Hyprland also respects the cursor theme
    env = [
      "XCURSOR_THEME,${cursorTheme}"
      "XCURSOR_SIZE,${toString cursorSize}"
    ];
  };

  # Export environment variables to make sure everything uses the correct cursor
  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
    MOZ_ENABLE_WAYLAND = "1"; # Ensure Firefox runs in Wayland mode
    GDK_SCALE = "1"; # Prevent GTK apps from scaling the cursor
    GDK_DPI_SCALE = "1";
  };
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      xwayland.force_zero_scaling = true;

      input = {
        kb_layout = "no";

        touchpad = {
          natural_scroll = true;
          disable_while_typing = false;
        };
      };

      # Activate on button press
      bind = [
        "SUPER, Q, killactive"
        "SUPER, T, exec, kitty"

        "SUPERSHIFT, B, exec, firefox"

        # Audio
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        # Screen mode
        "SUPER, F, fullscreen, 1"
        "SUPERSHIFT, F, fullscreen, 0"
        "SUPER, G, togglefloating"

        # Window focus
        "ALT, TAB, cyclenext"
        "ALT, TAB, bringactivetotop"
        "SUPERSHIFT, H, movewindow, l"
        "SUPERSHIFT, L, movewindow, r"
        "SUPERSHIFT, K, movewindow, u"
        "SUPERSHIFT, J, movewindow, d"

        # Move to workspace
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        # Move focused windo to workspace
        "SUPERSHIFT, 1, movetoworkspace, 1"
        "SUPERSHIFT, 2, movetoworkspace, 2"
        "SUPERSHIFT, 3, movetoworkspace, 3"
        "SUPERSHIFT, 4, movetoworkspace, 4"
        "SUPERSHIFT, 5, movetoworkspace, 5"
        "SUPERSHIFT, 6, movetoworkspace, 6"
        "SUPERSHIFT, 7, movetoworkspace, 7"
        "SUPERSHIFT, 8, movetoworkspace, 8"
        "SUPERSHIFT, 9, movetoworkspace, 9"
        "SUPERSHIFT, 0, movetoworkspace, 10"

        ", PRINT, exec, grim ~/Pictures/screenshot-$(date +'%Y-%m-%d-%H%M%S').png"
        "SHIFT, PRINT, exec, grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +'%Y-%m-%d-%H%M%S').png"
        # Select a region, take a screenshot, and open in swappy for annotation
        "SUPERSHIFT, S, exec, grim -g \"$(slurp)\" - | swappy -f -"
      ];

      # Trigger on release
      bindr = [
        # Open app launcher
        "SUPER, SUPER_L, exec, kill $(pidof rofi) || rofi -show drun"
      ];

      # Toggle binds
      bindl = [
        ", XF86AudioMicMute, exec, ${toggle_mic} && ${update_mic_led}"
      ];

      # Repeat when held
      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set 10%+"
      ];

      # Mouse bindings
      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      monitor = [
        "desc:Acer Technologies KG271 TF5EE0098522, preferred, 0x0, 1"
        "desc:BNQ BenQ GL2450 K2E02672019, preferred, auto-right, 1"
      ];
    };
  };
}
