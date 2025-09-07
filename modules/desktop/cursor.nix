{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.modules.cursor;
in
{
  options.modules.cursor = {
    enable = lib.mkEnableOption "Enable modules pointer module.";

    theme = lib.mkOption {
      type = lib.types.str;
      default = "Bibata-Modern-Ice";
      description = "GTK cursor theme.";
      example = "Bibata-Modern-Ice";
    };

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.bibata-cursors;
      description = "Package providing the cursor theme.";
      example = "pkgs.bibata-cursors";
    };

    size = lib.mkOption {
      type = lib.types.int;
      default = 8;
      description = "Cursor size.";
      example = 8;
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt.home.pointerCursor = {
      name = cfg.theme;
      size = cfg.size;
      package = cfg.package;
      hyprcursor.enable = true;
      x11.enable = true;
      gtk.enable = true;
    };
  };
}
