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
      ];
      bindr = [
        "SUPER,SUPER_L,exec,kill $(pidof rofi) || rofi -show drun"
      ];
    };  
  };
}
