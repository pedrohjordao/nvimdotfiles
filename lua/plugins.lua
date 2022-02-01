local fn = vim.fn
local cmd = vim.cmd
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

cmd [[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]]

return require('packer').startup(function(use)
  -- My plugins here
  use { 'lewis6991/impatient.nvim' }
  use {
	  'rcarriga/nvim-notify',
	  config = function() 
		  require('notify_local').setup()
	  end
  }
  use {
	'morhetz/gruvbox',
	config = function() 
		vim.opt.termguicolors = true
		vim.cmd('colorscheme gruvbox')
	end
  }
  use {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate',
	config = function()
		require('treesitter_local').setup()
	end
  }
  use {
    'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = function() 
	      require('tree_local').setup()
      end
  }
  use {
	  'scalameta/nvim-metals',
	  requires = { 'nvim-lua/plenary.nvim' }
  }
  use { 'L3MON4D3/LuaSnip' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'onsails/lspkind-nvim' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 
	  'hrsh7th/nvim-cmp',
	  require = { 'L3MON4D3/LuaSnip' },
	  config = function()
		  require('cmp_local').setup()
	  end
  }

  use {
	'neovim/nvim-lspconfig',
	config = function()
		require('lsp_local').setup()
	end
  }
  use { 'norcalli/nvim-colorizer.lua' }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }
  use { 
	  'tpope/vim-fugitive',
	  config = function()
		  require('fugitive_local').setup()
	  end

  }
  use { 'junegunn/gv.vim' }
  use { 'rhysd/git-messenger.vim' }
  use {
	'numToStr/Comment.nvim',
	config = function()
	    require('Comment').setup()
	end
  }
  use { 'simrat39/rust-tools.nvim' }
  use { 'mfussenegger/nvim-dap' }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function()
	    require('telescope_local').setup()
    end
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() 
	    require('trouble_local').setup {}
    end
  }

  use { 
	  'windwp/nvim-autopairs',
	  config = function() 
		  require('nvim-autopairs').setup {}
	  end
  }

  use { 'tpope/vim-dispatch' }
  use { 'sbdchd/neoformat' }
  use {
	'kosayoda/nvim-lightbulb',
	config = function() 
		require('lightbulub_local').setup {}
	end
  }

  use {
    'ray-x/lsp_signature.nvim',
    config = function()
	    require('lsp_signature').setup {}
    end
  }
  use {
    'gelguy/wilder.nvim',
    config = function()
            require('wilder_local').setup {}
    end
  }
  use {
	  'j-hui/fidget.nvim',
	  config = function()
		  require('fidget').setup {}
	  end
  }
  use {
	  'akinsho/toggleterm.nvim',
	  config = function() 
		  require('toggleterm_local').setup {}
	  end
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
