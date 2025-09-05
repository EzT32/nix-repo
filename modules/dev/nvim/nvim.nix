{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.nvim;
in
{
  options.custom.nvim = {
    enable = lib.mkEnableOption "Enable custom nvim configuration.";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
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
          statix

          wl-clipboard

          gcc # remove when gcc is added globally
        ];

        plugins = with pkgs.vimPlugins; [
          nvim-lspconfig
          nvim-treesitter
          nvim-treesitter-parsers.lua 
          nvim-treesitter-parsers.nix 
          nvim-treesitter-parsers.bash

          telescope-nvim
          plenary-nvim

          neodev-nvim

          gruvbox-nvim
          lualine-nvim

          indent-blankline-nvim
          comment-nvim

          none-ls-nvim

          nvim-cmp
          cmp-nvim-lsp
          cmp-buffer
          cmp-path
          luasnip
          cmp_luasnip
        ];
      };

      home.packages = with pkgs; [
        nixfmt-rfc-style
      ];

      xdg.configFile."nvim/init.lua".source = ./init.lua;
      xdg.configFile."nvim/lua".source = ./lua;
    };
  };
}
