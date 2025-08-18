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

        telescope-nvim
        plenary-nvim

        neodev-nvim

        gruvbox-nvim
        lualine-nvim
        indent-blankline-nvim

        none-ls-nvim
      ];
    };

    home.packages = with pkgs; [
      nixfmt-rfc-style
    ];

    xdg.configFile."nvim/init.lua".source = ./init.lua;
    xdg.configFile."nvim/lua".source = ./lua;
  };
}
