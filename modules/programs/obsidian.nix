{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.programs.obsidian;
in
{
  options.custom.programs.obsidian = {
    enable = lib.mkEnableOption "Enable obsidian";

    vaultPath = lib.mkOption {
      type = lib.types.path;
      default = "${config.home.homeDirectory}/Notes";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      home.packages = with pkgs; [
        obsidian
      ];
    };
  };
}
