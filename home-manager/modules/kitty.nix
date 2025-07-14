{pkgs, ...}:
let
  kitty-themes = pkgs.fetchFromGitHub {
    owner = "dexpota";
    repo = "kitty-themes";
    rev = "b1abdd54ba655ef34f75a568d78625981bf1722c";
    sha256 = "sha256-RcDmZ1fbNX18+X3xCqqdRbD+XYPsgNte1IXUNt6CxIA=";
  };

  gruvbox-dark = "${kitty-themes}/themes/gruvbox_dark.conf";
in 
{
  programs.kitty = {
    enable = true;

    font = {
      name = "FiraCode Nerd Font";
      size = 10;
    };

    extraConfig = builtins.readFile gruvbox-dark;

    settings = {
      window_padding_width = 0;
      enable_audio_bell = false;
      linux_display_server = "wayland";
      background_opacity = "0.8";
    };
  };

  home.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}

