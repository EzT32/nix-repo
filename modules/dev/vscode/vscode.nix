{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.vscode;

  vscodePython = pkgs.python313;
in
{
  options.modules.programs.vscode = {
    enable = lib.mkEnableOption "Enable vscode";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      programs.vscode = {
        enable = true;
        package = pkgs.vscodium.fhs;

        profiles.default = {
          userSettings = {
            # Formatting
            "editor.formatOnSave" = true;
            "[python]" = {
              "editor.defaultFormatter" = "charliermarsh.ruff";
            };

            "python.defaultInterpreterPath" = "${vscodePython}/bin/python";

            # Ricing
            "workbench.colorTheme" = "Gruvbox Dark Medium";

            # LSP
            "python.languageServer" = "Pylance";
            "python.analysis.languageServerMode" = "full";
            "python.analysis.enableEditableInstalls" = false;

            # Wordwrap
            "editor.wordWrap" = "on";
          };

          extensions = with pkgs.vscode-extensions; [
            ms-python.python
            charliermarsh.ruff
            ms-python.vscode-pylance
            #ms-toolsai.jupyter
            ms-vscode.live-server
            ms-vsliveshare.vsliveshare
            ms-python.debugpy

            # Colortheme
            jdinhlife.gruvbox
            pkief.material-icon-theme

            # Docstrings
            njpwerner.autodocstring
          ];

        };

      };
    };
  };
}
