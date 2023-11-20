lua if vim.loader then vim.loader.enable() end

packadd vim-jetpack
call jetpack#begin()
	Jetpack 'tani/vim-jetpack', {'opt': 1} "bootstrap
	Jetpack 'vim-airline/vim-airline'
	Jetpack 'vim-airline/vim-airline-themes'
	Jetpack 'tpope/vim-commentary'
	Jetpack 'neoclide/coc.nvim', {'branch': 'release'}
	Jetpack 'preservim/nerdtree'
	Jetpack 'ryanoasis/vim-devicons'
call jetpack#end()

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
nmap <C-f> :NERDTreeToggle<CR>
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" Airline SETTINGS
let g:airline_powerline_fonts = 1

" Esc SETTINGS
inoremap jk <Esc>
inoremap jj <Esc>

" aliases
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"/// SPLIT BORDER SETTINGS
hi VertSplit cterm=none
