vim.cmd('packadd vim-jetpack')
require('jetpack.packer').startup(function(use)
  -- Plugin Manager
  use {
    'tani/vim-jetpack',
    opt=true,
  }
  -- Filer
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch='v3.x',
    cmd={'Neotree'},
    requires={
      {'nvim-lua/plenary.nvim', opt=true, after='neo-tree.nvim'},
      {'nvim-tree/nvim-web-devicons', opt=true, after='neo-tree.nvim'},
      {'MunifTanjim/nui.nvim', opt=true, after='neo-tree.nvim'},
    },
    config=function()
      require('plugins/neotree')
    end
  }
  -- Fizzy Finder
  use {
    'nvim-telescope/telescope.nvim',
    cmd={'Telescope'},
    requires={
      {'nvim-lua/plenary.nvim', opt=true, after='telescope.nvim'},
      {'nvim-telescope/telescope-project.nvim', opt=true, after='telescope.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', opt=true, after='telescope.nvim'},
    },
  }
  -- Zen Mode
  use {
    'folke/zen-mode.nvim',
    cmd={'ZenMode'},
  }
  use {
    'williamboman/mason.nvim',
    -- cmd={
    --   'Mason',
      -- 'MasonInstall',
      -- 'MasonUninstall',
      -- 'MasonUninstallAll',
      -- 'MasonLog',
      -- 'MasonUpdate',
    -- },
    requires={
      {'williamboman/mason-lspconfig.nvim'},
      {'jayp0521/mason-null-ls.nvim'},   
      {'nvimtools/none-ls.nvim'},
    },
    config=function()
      require('mason').setup()
    end
  }
  use {
    'jackMort/ChatGPT.nvim',
    opt=true,
  }
  use {
    'gsuuon/note.nvim',
    cmd={'Note'},
  }
  use {
    'kevinhwang91/nvim-ufo',
    requires={'kevinhwang91/promise-async'},
  }
  use {
    'petertriho/nvim-scrollbar',
    config=function()
      require('scrollbar').setup()
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    config=function()
      require('plugins/lualines')
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    config=function()
      require('plugins/treesitter')
    end
  }
  use {
    'windwp/nvim-autopairs',
    config=function()
      require('plugins/autopairs')
    end
  }
  use {
    'kylechui/nvim-surround',
    config=function()
      require("nvim-surround").setup({})
    end
  }
  use {
    'karb94/neoscroll.nvim',
    keys={'<C-d>', '<C-u>'},
    config=function()
      require('neoscroll').setup({})
    end
  }
  use {
    'Weissle/easy-action',
    requires={'kevinhwang91/promise-async'},
    config=function()
      require('plugins/easyaction')
    end
  }
  use {
    'numToStr/Comment.nvim',
    config=function()
      require('Comment').setup()
    end
  }
  use {
    'akinsho/nvim-bufferline.lua',
    config=function()
      require('plugins/bufferline')
    end
  }
  use {
    'phaazon/hop.nvim',
    event={'BufRead'},
    config=function()
      require('hop').setup{
        multi_windows=true,
      }
    end
  }
  use {
    'hrsh7th/nvim-cmp',
    requires={
      {'hrsh7th/cmp-nvim-lsp', opt=true, after='nvim-cmp'},
      {'hrsh7th/cmp-buffer', opt=true, after='nvim-cmp'},
      {'hrsh7th/cmp-path', opt=true, after='nvim-cmp'},
    }
  }
  use {'nvimdev/lspsaga.nvim'}
  use {'folke/trouble.nvim'}
  use {'onsails/lspkind.nvim'}
  use {'lewis6991/gitsigns.nvim'}
  use {'inkarkat/vim-ReplaceWithRegister'}

  use {'gcmt/wildfire.vim'}
end)
