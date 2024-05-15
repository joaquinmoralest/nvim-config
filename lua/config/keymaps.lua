-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silet = true }

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

vim.keymap.set("n", "C-h", ":wincmd h<CR>")
vim.keymap.set("n", "C-j", ":wincmd j<CR>")
vim.keymap.set("n", "C-k", ":wincmd k<CR>")
vim.keymap.set("n", "C-l", ":wincmd l<CR>")
