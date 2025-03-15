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
  {
    'goolord/alpha-nvim',
    config = function()
      require('alpha').setup(require('alpha.themes.dashboard').config)
    end,
  },
}
