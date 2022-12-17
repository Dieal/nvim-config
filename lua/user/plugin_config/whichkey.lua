wk = require ("which-key")

-- Normal mode
-- Single Commands
wk.register({
    ['/'] = { 'CommentToggle<CR>', 'Comment Line' },
    v = { 'vsp<CR>', 'Splits Window vertically' },
    h = { 'sp<CR>', 'Splits Window Horizontally' },
    e = { 'Lex 15<CR>', 'Open File Tree' },
    x = { 'JABSOpen<CR>', 'Open JABS'},
}, { mode = 'n', prefix = '<leader>'})

-- Normal mode
-- Groups
wk.register({

    f = {
        name = "+file",
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open old files"},
        v = { "<cmd>vnew<cr>", "New file in vertical split window" },
        h = { "<cmd>vnew<cr>", "New file in horizontal split window" },
        c = { "<cmd>vnew<cr>", "New file in current window" },
    },

}, { mode = 'n', prefix = '<leader>' })

-- Visual Mode
wk.register({
    ['/'] = { "\'<,\'>CommentToggle<CR>", "Comment Lines"},
}, { mode = 'v', prefix = '<leader>' })
