vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- move line up/down
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- duplicate line up/down
keymap.set("n", "<A-S-j>", "yyp", { desc = "Duplicate line down" })
keymap.set("n", "<A-S-k>", "yyP", { desc = "Duplicate line up" })

-- toggle terminal at the bottom
local term_buf = nil
local term_win = nil

local function toggle_terminal()
  -- if terminal window is open, close it
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_close(term_win, true)
    term_win = nil
    return
  end

  -- open a horizontal split at the bottom
  vim.cmd("botright 10split")

  -- if we already have a terminal buffer, reuse it
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    vim.api.nvim_win_set_buf(0, term_buf)
  else
    vim.cmd("terminal")
    term_buf = vim.api.nvim_get_current_buf()
  end

  term_win = vim.api.nvim_get_current_win()
  vim.cmd("startinsert")
end

keymap.set("n", "<leader>tt", toggle_terminal, { desc = "Toggle terminal" })
keymap.set("t", "<leader>tt", toggle_terminal, { desc = "Toggle terminal" })
keymap.set("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
