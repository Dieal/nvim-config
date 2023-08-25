-- Harpoon Setup
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>hm', mark.add_file, { desc = '[H]arpoon: [M]ark file' });
vim.keymap.set('n', '<leader>hr', mark.rm_file, { desc = '[H]arpoon: [R]emove Mark' });
vim.keymap.set('n', '<leader>ht', ui.toggle_quick_menu, { desc = '[H]arpoon: [T]oggle Ui' });
vim.keymap.set('n', '<C-j>', ui.nav_next, { desc = 'Harpoon: Next Mark' });

-- Disable Netwr
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- [nvim-tree setup]
require('nvim-tree').setup();

vim.keymap.set('n', '<leader>t', vim.cmd.NvimTreeToggle, { desc = "Toggles [T]ree" })
