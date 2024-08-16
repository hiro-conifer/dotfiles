local OP=vim.opt
local LANG='utf-8'

vim.scriptencoding=LANG
OP.encoding=LANG
OP.shell='zsh'
OP.title = true
OP.number=true
OP.ff=unix
OP.expandtab=true
OP.tabstop=2
OP.shiftwidth=2
OP.ignorecase=true
OP.smartcase=true
OP.wildmenu=true
OP.background=dark
OP.completeopt=menuone,noinsert
