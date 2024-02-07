local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
local plugins = {
    'catppuccin/nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
}
require('lazy').setup(plugins, {})
local set = vim.keymap.set
vim.g.mapleader = ' ' 
set('n', '<leader>pv', vim.cmd.Ex)
set('n', ';', ':')
set('n', '<leader><leader>x', function()
	vim.cmd.w()
	vim.cmd.so('%')
end)
vim.cmd.set('rnu nu')
vim.cmd.colorscheme('catppuccin')
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pd', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function() builtin.grep_string({ search = vim.fn.input('Grep > ') }) end)
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
