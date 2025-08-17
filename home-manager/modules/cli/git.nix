{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.custom.git;
in
{
  options.custom.git = {
    enable = lib.mkEnableOption "Enable custom git configurations.";

    userName = lib.mkOption {
      type = lib.types.str;
      example = "Username";
    };

    userEmail = lib.mkOption {
      type = lib.types.str;
      example = "username@gmail.com";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      package = pkgs.gitFull;

      userName = cfg.userName;
      userEmail = cfg.userEmail;

      extraConfig = {
        credential.helper = "libsecret";
      };
    };

    home.packages = with pkgs; [
      libsecret
    ];
  };
}
