{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.vscode;

  vscodePython = pkgs.python312;
in
{
  options.modules.programs.vscode = {
    enable = lib.mkEnableOption "Enable vscode";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      programs.vscode = {
        enable = true;
        package = pkgs.vscodium;

        userSettings = {
          "editor.formatOnSave" = true;
          "settingsSync.enabled" = false;
          "python.defaultInterpreterPath" = "${vscodePython}/bin/python";

          # Use Black only for Python files
          "[python]" = {
            "editor.defaultFormatter" = "ms-python.black-formatter";
          };

          # Optional: Ruff diagnostics in editor
          "python.linting.enabled" = true;
          "python.linting.ruffEnabled" = true;

          # Jupyter inline outputs
          "jupyter.askForKernelRestart" = false;

          "workbench.colorTheme" = "Gruvbox Dark Medium";
        };
      };
    };
  };
}
