{...}:
{
  imports = [ ./waybar.nix ];

  home.file = {
    ".config/waybar/config".source = ./config;
    ".config/waybar/style.css".source = ./style.css;
  };
}
