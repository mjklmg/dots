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
	{src="https://github.com/lervag/vimtex" },
	{src="https://github.com/vague-theme/vague.nvim" },
})

vim.cmd.colorscheme("vague")

require("mason").setup({})
vim.lsp.enable({"lua_ls", "clangd"}) -- :MasonInstall lua-language-server clangd

vim.g.vimtex_view_method = "zathura"

vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
vim.keymap.set("n", "<leader>q", "<CMD>:bd!<CR>")
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')

local function terminal_here()
	local dir = vim.fn.expand("%:p:h")
	vim.cmd("botright new")
	vim.fn.termopen(vim.o.shell, { cwd = dir, })
	vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>t", terminal_here)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<leader>tq", "<CMD>bwipeout!<CR><C-n>")

-- bultin autocompletion, its kinda limited but works
vim.opt.autocomplete = true
vim.opt.complete:append('o')
vim.opt.completeopt = {'menuone', 'noselect'}
