{config, lib, ...}:
let
  cfg = config.custom.shell.eza;
in 
  {
  options.custom.shell.eza = {
    enable = lib.mkEnableOption "Enable custom eza configuration";
  };

  config = lib.mkIf cfg.enable {
    programs.eza = {
      enable = true;
    };
  };
}
