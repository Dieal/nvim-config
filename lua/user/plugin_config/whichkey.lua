wk = require ("which-key")

-- Normal mode
-- Single Commands
wk.register({
    ['/'] = { '<cmd>CommentToggle<CR>', 'Comment Line' },
    v = { '<cmd>vsp<CR>', 'Splits Window vertically' },
    h = { '<cmd>sp<CR>', 'Splits Window Horizontally' },
    e = { '<cmd>NvimTreeToggle<CR>', 'Open nvim-tree' },
    x = { '<cmd>norm <C-w>c<CR>', 'Closes Window' }, 
    j = { '<cmd>JABSOpen<CR>', 'Open JABS'},
}, { mode = 'n', prefix = '<leader>'})

-- Normal mode
-- Groups
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
    }

}, { mode = 'n', prefix = '<leader>' })

-- Visual Mode
wk.register({
    ['/'] = { "<cmd>norm gcc<CR>", "Comment Lines"},
}, { mode = 'v', prefix = '<leader>' })
