{pkgs, ...}:

let
  cursorTheme = "Bibata-Modern-Ice";
  cursorSize = 8;
in
{
  config = {
    home.pointerCursor = {
      hyprcursor = {
        enable = true;
        size = cursorSize;
      };
      name = cursorTheme;
      package = pkgs.bibata-cursors;
      size = cursorSize;
      x11.enable = true;
      gtk.enable = true;
    };

    gtk = {
      enable = true;
      cursorTheme = {
        name = cursorTheme;
        package = pkgs.bibata-cursors;
      };
    };
  };
}
