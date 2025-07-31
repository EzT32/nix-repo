# desktop/wayland.nix

{...}:
{
  config = {
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
  };
}
