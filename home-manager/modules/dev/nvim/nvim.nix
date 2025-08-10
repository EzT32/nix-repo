{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.custom.nvim;
in {
  options.custom.nvim = {
    enable = lib.mkEnableOption "Enable custom nvim configuration.";
  };

  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true; 

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraPackages = with pkgs; [
        lua-language-server
        stylua
        luaPackages.luacheck

        nil
        alejandra
        statix

        wl-clipboard
      ];

      plugins = with pkgs.vimPlugins; [
        nvim-lspconfig
        none-ls-nvim

        gruvbox-nvim
        lualine-nvim
      ];
    };

    xdg.configFile."nvim/init.lua".source = ./init.lua;
    xdg.configFile."nvim/lua".source = ./lua;
  };
}
