{ lib, config, ... }:
let
  cfg = config.custom.hyprland.keybinds.workspace;
in
{
  options.custom.hyprland.keybinds.workspace = {
    enable = lib.mkEnableOption "Workspace keybinds";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      wayland.windowManager.hyprland.settings = {
        bind = [
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
        ];
      };
    };
  };
}
