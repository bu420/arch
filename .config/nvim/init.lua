vim.g.mapleader = ' '
vim.opt.clipboard = 'unnamedplus'

-- Automatically install packer if not installed
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'hoob3rt/lualine.nvim'
  use 'tpope/vim-fugitive'
  use 'arcticicestudio/nord-vim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)

-- Clang Format keybind
vim.keymap.set('n', '<leader>cf', ':!clang-format -i %<CR>', { noremap = true, silent = true })

-- Copy/Paste keybinds (Ctrl+Shift+C and Ctrl+Shift+V)
vim.keymap.set('n', '<C-c>', '"+y', { noremap = true, silent = true })
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<C-v>', '"+p', { noremap = true, silent = true })
vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })

-- Save keybinds
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-s>', '<Esc>:w<CR>gv', { noremap = true, silent = true })

-- Telescope keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.cmd [[
  colorscheme nord

  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none

  set number
]]
