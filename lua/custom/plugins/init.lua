return {
  {
    'vim-airline/vim-airline',
    lazy = false, -- Ensure it loads immediately
    config = function()
      vim.g.airline_theme = 'powerlineish' -- Set the theme
      -- vim.g.airline_theme = 'solarized' -- Set the theme
      vim.g['airline#extensions#tabline#enabled'] = 1 -- Enable tabline
      vim.g['airline#extensions#tabline#fnamemod'] = ':t'
      vim.g['airline#extensions#tabline#show_tab_nr'] = 1 -- Show tab numbers

      vim.g['airline_detect_modified'] = 1
      vim.g['airline_powerline_fonts'] = 1
      vim.g['airline#extensions#tabline#buffer_idx_mode'] = 1
      vim.g.airline_extensions = { 'branch', 'tabline' }
    end,
  },
  {
    'vim-airline/vim-airline-themes',
    lazy = false, -- Ensure themes load
  },
  -- {
  --   'goolord/alpha-nvim',
  --   dependencies = { 'echasnovski/mini.icons' },
  --   config = function()
  --     require('alpha').setup(require('alpha.themes.startify').config)
  --   end,
  -- },
  {
    'goolord/alpha-nvim',
    config = function()
      require('alpha').setup(require('alpha.themes.dashboard').config)
    end,
  },

  {
    'epeli/slimux',
    event = 'VeryLazy',
    config = function()
      vim.g.slimux_pane = '1' -- Default tmux pane to send text to
    end,
  },
  {
    'jgdavey/tslime.vim',
    event = 'VeryLazy',
    config = function()
      vim.g.tslime_always_current_session = 1
      vim.g.tslime_always_current_window = 1
      vim.g.tslime_auto_scroll = 1
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      local cmp = require 'cmp'

      cmp.setup {
        mapping = {
          ['<Tab>'] = cmp.mapping.select_next_item(), -- Tab to go to next item
          ['<S-Tab>'] = cmp.mapping.select_prev_item(), -- Shift+Tab to go back
          ['<CR>'] = cmp.mapping.confirm { select = true }, -- Enter to confirm
          ['<C-Space>'] = cmp.mapping.complete(), -- Keep Ctrl+Space for manual completion
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        },
      }
    end,
  },
  -- Vim Tmux integration plugin
  {
    'tmux-plugins/vim-tmux',
    ft = 'tmux',
  },
  -- Seamless navigation between tmux and vim splits
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    config = function() end,
  },
}
