{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.modules.desktop.hyprland.hyprsunset;
in
{
  options.modules.desktop.hyprland.hyprsunset = {
    enable = lib.mkEnableOption "Enable hyprsunset service.";

  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      services.hyprsunset = {
        enable = true;

        transitions = {
          sunrise = {
            calendar = "*-*-* 07:30:00";
            requests = [
              [
                "temperature"
                "6000"
              ]
            ];
          };

          sunset = {
            calendar = "*-*-* 21:00:00";
            requests = [
              [
                "temperature"
                "4500"
              ]
            ];
          };
        };
      };

      home.packages = with pkgs; [
        hyprsunset
      ];

      wayland.windowManager.hyprland.settings = {
        bindl = [
          "SUPER, Y, exec, hyprsunset temperature 2000"
          "SUPER, U, exec, hyprsunset temperature 4500"
        ];
      };
    };
  };
}
