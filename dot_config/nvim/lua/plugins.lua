vim.cmd('packadd vim-jetpack')
require('jetpack.packer').startup(function(use)
  use {'tani/vim-jetpack'}
  use {'xiyaowong/transparent.nvim'}
  use {'nvim-neo-tree/neo-tree.nvim', branch='v3.x', requires={'nvim-lua/plenary.nvim','nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim',}}
  use {'nvim-telescope/telescope.nvim', tag='0.1.8', requires={'nvim-lua/plenary.nvim'}}
  use {'nvim-telescope/telescope-project.nvim'}
  use {'williamboman/mason.nvim'}
  use {'williamboman/mason-lspconfig.nvim'}
  use {'jayp0521/mason-null-ls.nvim'}
  use {'nvimtools/none-ls.nvim'}
  use {'nvimdev/lspsaga.nvim'}
  use {'folke/trouble.nvim'}
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'onsails/lspkind.nvim'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'nvim-treesitter/nvim-treesitter'}
  use {'akinsho/nvim-bufferline.lua'}
  use {'nvim-lualine/lualine.nvim'}
  use {'karb94/neoscroll.nvim'}
  use {'petertriho/nvim-scrollbar'}
  use {'folke/noice.nvim'}
  use {'kevinhwang91/nvim-ufo'}
  use {'nvim-telescope/telescope-fzf-native.nvim'}
  use {'lewis6991/gitsigns.nvim'}
  use {'FotiadisM/tabset.nvim'}
  use {'christoomey/vim-tmux-navigator'}
  use {'kylechui/nvim-surround'}
  use {'inkarkat/vim-ReplaceWithRegister'}
  use {'numToStr/Comment.nvim'}
  use {'windwp/nvim-autopairs'}
  use {'iamcco/markdown-preview.nvim'}
  use {'phaazon/hop.nvim'}
  use {'folke/zen-mode.nvim'}
  use {'Weissle/easy-action'}
  use {'jackMort/ChatGPT.nvim'}
  use {'gcmt/wildfire.vim'}
  use {'gsuuon/note.nvim'}
  --use {''}
end)
