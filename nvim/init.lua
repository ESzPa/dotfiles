-- General
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('config') .. '/undo'

-- Keybindings
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true})
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true})
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { noremap = true})
vim.keymap.set("n", "<leader>t", ":lcd %:p:h | terminal<CR>", { noremap = true})
vim.keymap.set("n", "<leader>tt", ":lcd %:p:h | split | terminal<CR>", { noremap = true}) 
vim.keymap.set("n", "<leader>tv", ":lcd %:p:h | vsplit | terminal<CR>", { noremap = true})

-- Plugins (lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git", lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            vim.cmd("colorscheme gruvbox")
        end
    },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "neovim/nvim-lspconfig" },
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } }
})

local lspconfig = require("lspconfig")
lspconfig.clangd.setup({})

require("nvim-treesitter.configs").setup {
    highlight = { enable = true }
}

require('lualine').setup {
    options = {
        theme = 'gruvbox',
        section_separators = '',
        component_separators = '|',
     }
}
