{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.obsidian;
in
{
  options.modules.programs.obsidian = {
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
