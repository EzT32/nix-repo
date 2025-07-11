{lib, pkgs, config, ... }:

let
  cfg = config.my.keybinds; # Module from ../options.nix

  updateMicLed = pkgs.writeShellScript "update-mic-led" ''
    micStatus=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -c MUTED)
    brightnessctl -d platform::micmute set "$micStatus"
  '';

  toggleMic = pkgs.writeShellScript "toggle-mic" ''
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
    ${updateMicLed}
    '';
in {
  config = lib.mkIf cfg.enableLaptopExtras {
    my.keybinds.toggleMic = "${toggleMic}";
    my.keybinds.updateMicLed = "${updateMicLed}";


    wayland.windowManager.hyprland.settings = {
      bind = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];
      bindl = [
        ", XF86AudioMicMute, exec, ${cfg.toggleMic}"
      ];

      binde = [
        ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set 10%+"
      ];
    };
  };
}
