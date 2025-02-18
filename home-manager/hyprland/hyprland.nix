{ config, pkgs, lib, ... }:
let
  toggle_mic = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
  mic_status = "wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -c MUTED";
  update_mic_led = "brightnessctl -d platform::micmute set $(${mic_status})";
in
{
  imports = [
    ./kitty.nix
    ./hyprpaper.nix
    ./rofi.nix
    #./swww.nix
    ./dolphin.nix
    ./waybar/waybar.nix
    ./hypridle.nix
    ./hyprlock.nix
  ];

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

	# Switch to resize submap
	#"ALT, R, submap, resize"
	#", ESCAPE, submap, reset"

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
      bindro = [
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
	#", RIGHT, resizeactive, 10 0"
	#", LEFT, resizeactive, -10 0"
	#", UP, resizeactive, 0 -10"
	#", DOWN, resizeactive, 0 10"
      ];

     # submap = [
	# Used to resize windows
	#"resize"

	# Reset submap and return to global submap
	#"reset"
      #];
    };

  };

  #services.swayosd.enable = true;
}
