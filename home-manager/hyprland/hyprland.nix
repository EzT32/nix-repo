{ config, pkgs, lib, ...}:
let
  toggle_mic = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
  mic_status = "wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -c MUTED";
  update_mic_led = "brightnessctl -d platform::micmute set $(${mic_status})";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      input = {
        kb_layout = "no";
        touchpad = {
          natural_scroll = true;
          disable_while_typing = false;
        };
      };
      xwayland.force_zero_scaling = true;
      bind = [
        "SUPER,q,killactive"
        "SUPER,t,exec,kitty"
        "SUPER_SHIFT,b,exec,firefox"
	", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	"SUPER, f, fullscreen, 1"
	"SUPERSHIFT, f, fullscreen, 0"
	"alt,tab,cyclenext"
	"alt,tab,bringactivetotop"
	"SUPER,1,workspace,1"
	"SUPER,2,workspace,2"
	"SUPER,3,workspace,3"
	"SUPER,4,workspace,4"
	"SUPER,5,workspace,5"
	"SUPERSHIFT,1,movetoworkspace,1"
	"SUPERSHIFT,2,movetoworkspace,2"
	"SUPERSHIFT,3,movetoworkspace,3"
	"SUPERSHIFT,4,movetoworkspace,4"
	"SUPERSHIFT,5,movetoworkspace,5"
	"SUPER, g, togglefloating"
	"SUPERSHIFT, h, movewindow, l"
	"SUPERSHIFT, l, movewindow, r"
	"SUPERSHIFT, k, movewindow, u"
	"SUPERSHIFT, j, movewindow, d"
	];

      bindr = [
        "SUPER,SUPER_L,exec,kill $(pidof rofi) || rofi -show drun"
      ];

      bindl = [
        ", XF86AudioMicMute, exec, ${toggle_mic} && ${update_mic_led}"
      ];

      binde = [
        ",XF86AudioRaiseVolume,exec,wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
	", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
      ];
    };

  };

  #services.swayosd.enable = true;
}
