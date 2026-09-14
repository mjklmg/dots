local vim = vim

vim.g.mapleader = " "

vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- opt.wrap = false
vim.opt.cursorcolumn = false
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.o.winborder = "rounded"

vim.pack.add({
	{src="https://github.com/neovim/nvim-lspconfig"},
	{src="https://github.com/mason-org/mason.nvim"},
})

vim.cmd.colorscheme("habamax")

require("mason").setup({})
vim.lsp.enable({"lua_ls", "clangd"})

vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')

-- vim.opt.autocomplete = true
-- 
-- vim.opt.complete:append('o')
-- vim.opt.completeopt = {'menuone', 'noselect'}
