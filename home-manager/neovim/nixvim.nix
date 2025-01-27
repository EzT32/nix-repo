{ config, pkgs, lib, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = {
      lightline.enable = true;
      # Language server provider
      lsp = {
	enable = true;
	servers.pylsp.enable = true;
      };
      conform-nvim = {
	enable = true;
	settings = {
	  formatters_by_ft = {
	    python = [ "black" ];
	  };
	};
      };
      cmp = {
	enable = true;
	autoEnableSources = true;
  	settings = {
	  sources = [
	    {name = "nvim_lsp";}
	    {name = "treesitter";}
	    {name = "buffer";}
	  ];
	  mapping = {
	    "<C-Space>" = "cmp.mapping.complete()";
	    "<CR>" = "cmp.mapping.confirm()";
	    "<C-c>" = "cmp.mapping.abort()";
	    "<Tab>" = "cmp.mapping.select_next_item()";
	    "<S-Tab>" = "cmp.mapping.select_prev_item()";
	  };
	};
      };
      cmp-treesitter.enable = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>f";
        action = "<CMD>lua require('conform').format()<CR>";
        options = {
          noremap = true;
          silent = true;
          nowait = true;
        };
      }
    ];
    globals.mapleader = " ";
    extraPlugins = [ pkgs.vimPlugins.gruvbox ];
    colorscheme = "gruvbox";
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2; 
    };
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
    defaultEditor = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.packages = [
    pkgs.black
  ];
}
