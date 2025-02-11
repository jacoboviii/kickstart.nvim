-- [[ Basic Keymaps ]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "<leader>h", "<Cmd>noh<CR>", { desc = "Clear [H]ighlight" })
vim.keymap.set("n", "<leader>q", "<Cmd>q<CR>", { desc = "[Q]uit" })
vim.keymap.set("n", "<leader>w", "<Cmd>w<CR>", { desc = "[W]rite" })
vim.keymap.set("n", "<leader>o", function()
	local bufs = vim.api.nvim_list_bufs()
	local current_buf = vim.api.nvim_get_current_buf()
	for _, i in ipairs(bufs) do
		if i ~= current_buf then
			vim.api.nvim_buf_delete(i, {})
		end
	end
end, { desc = "Close [O]ther Buffers" })

-- Register
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "To void register" })

-- Register : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "To system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "To system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "To void register" })

-- Esc in insert mode
vim.keymap.set("i", "jk", "<Esc>")

-- Navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Navigation

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
