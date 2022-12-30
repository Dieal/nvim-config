local wk = require ("which-key")

-- Function to open files
local open = function(path)
    return function()
        local cmd = 'edit'
        if vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()) ~= '' then
            cmd = 'tabnew'
        end
        vim.cmd[cmd] { args = { vim.fn.stdpath 'config' .. '/' .. path } }
    end
end

-- Noremap means "no recurse map"
-- Silent means we don't have an output for the map
local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap
local dir = 'lua/user/'

-- Remap <SPACE> as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--    normal_mode = "n"
--    visual mode = "v"
--    insert_mode = "i"
--    visual_block_mode = "x"
--    term_mode = "t"
--    command_mode = "c"

-- Normal mode
-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-k>", "<C-w>k", opts)

-- Buffer Controls
keymap("n", "<S-l>", ":bnext<CR>", opts) -- Next buffer
keymap("n", "<S-h>", ":bprevious<CR>", opts) -- Previous buffer
keymap("n", "<S-q>", ":bdelete!<CR>", opts) -- Closes buffer

-- Leader Key - Single commands
wk.register({
    ['/'] = { '<cmd>CommentToggle<CR>', 'Comment Line' },
    v = { '<cmd>vsp<CR>', 'Splits Window vertically' },
    h = { '<cmd>sp<CR>', 'Splits Window Horizontally' },
    e = { '<cmd>NvimTreeToggle<CR>', 'Open nvim-tree' },
    x = { '<cmd>norm <C-w>c<CR>', 'Closes Window' },
    j = { '<cmd>JABSOpen<CR>', 'Open JABS'},
    c = { '<cmd>cclose<CR>', 'Closes Quickfix'},
}, { mode = 'n', prefix = '<leader>'})

-- Leader Key - Groups
wk.register({

    f = {
        name = "+file",
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open old files"},
        v = { "<cmd>vnew<cr>", "New file in vertical split window" },
        h = { "<cmd>new<cr>", "New file in horizontal split window" },
        c = { "<cmd>new<cr>", "New file in current window" },
    }, g = {
        name = "+git",
        s = { "<cmd>vertical Git<CR><C-w>35<", "Status" },
        c = { "<cmd>vertical Git commit<CR>", "Commit" },
        d = { "<cmd>vertical Git diff<CR>", "Diff" },
        b = { "<cmd>vertical Git blame<CR>", "Blame" },
    }, b = {
        name = "+build",
        c = { "<cmd>OverseerRun<CR>1<CR><CR>", "Build C++ File"},
    }, c = {
        name = "+configs",
        c = { open (dir .. 'init.lua'), 'Common' },
        k = { open (dir .. 'keymaps.lua'), 'Keymaps' },
        o = { open (dir .. 'options.lua'), 'Options' },
        p = { open (dir .. 'plugins.lua'), 'Plugins' },
    }

}, { mode = 'n', prefix = '<leader>' })

-- Visual Mode
wk.register({
    ['/'] = { "<cmd>norm gcc<CR>", "Comment Lines"},
}, { mode = 'v', prefix = '<leader>' })

-- It doesn't yank selected text after pasting
keymap("v", "p", '"_dP', opts)
