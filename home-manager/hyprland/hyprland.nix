{ config, pkgs, lib, ...}:

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
        "SUPER_SHIFT,f,exec,firefox"
	", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"	
	#", XF86AudioMicMute, exec, /home/ezt/nix-repo/home-manager/hyprland/toggle_mic_mute.sh"
	];

      bindr = [
        "SUPER,SUPER_L,exec,kill $(pidof rofi) || rofi -show drun"
      ];

      binde = [
        ",XF86AudioRaiseVolume,exec,wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
	", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
      ];
    };  
  };
}
