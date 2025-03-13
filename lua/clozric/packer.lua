local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not (vim.uv or vim.loop).fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()


require('pckr').add{
  -- Packer can manage itself
  'wbthomason/packer.nvim';

  {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  };

  -- THEMES --
  { "catppuccin/nvim", as = "catppuccin" };
  { "savq/melange-nvim" };
  { "rebelot/kanagawa.nvim" };
  { "rose-pine/neovim", as = "rose-pine" };
  -- THEMES --

  {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  };
  {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional
      },
      config = function()
          require("nvim-tree").setup {}
      end
  };

  {'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}};
  {'mbbill/undotree'};

  {'tpope/vim-fugitive'};
  {
      'lewis6991/gitsigns.nvim',
  };

  {'Olical/conjure'};

  {
	  'VonHeikemen/lsp-zero.nvim',
      branch = 'v4.x',
	  requires = {
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},

          -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
	  }
  };
  {'ziglang/zig.vim'};
}
