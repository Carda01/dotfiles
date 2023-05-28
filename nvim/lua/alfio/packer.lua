-- This file can be loaded by calling `lua require('packer')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
         'nvim-telescope/telescope.nvim', tag = '0.1.1',
         -- or                            , branch = '0.1.x',
         requires = { {'nvim-lua/plenary.nvim'} }
  }

  --[[
  use({ 
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })
  --]]

  use({
	  'catppuccin/nvim',
	  as = 'catppuccin',
	  config = function()
		  vim.cmd.colorscheme "catppuccin-mocha"
	  end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-tree/nvim-web-devicons')
  use('nvim-treesitter/playground')
  use{
      'stevearc/oil.nvim',
      config = function() require('oil').setup() end
  }
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('tpope/vim-surround')
  use('ThePrimeagen/vim-be-good')
  -- use('luk400/vim-jukit')
  use('lervag/vimtex')
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
}

end)
