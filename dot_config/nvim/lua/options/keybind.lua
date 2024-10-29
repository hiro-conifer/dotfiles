local KEY=vim.keymap.set

KEY('n', '<C-n>', ':Neotree toggle<Return>')
KEY('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>')
KEY('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>')
