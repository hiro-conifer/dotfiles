local FN=vim.fn
local JETPACKPATH=FN.stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'

if FN.filereadable(JETPACKPATH) == 0 then
  FN.system('curl -fLo ' .. JETPACKPATH .. ' --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim')
  
  require('plugins/base')
  local jetpack = require('jetpack')
    for _, name in ipairs(jetpack.names()) do
        if not jetpack.tap(name) then
            jetpack.sync()
            vim.cmd("sleep 2")
            vim.api.nvim_command('q')
            vim.api.nvim_command('q')
            break
        end
    end
end
