" The root of all evil
let mapleader = ","

"================ Vim Settings ================================================


" colorschem (slate > desert)
if has("gui_running")
  " http://hcalves.deviantart.com/art/Mustang-Vim-Colorscheme-98974484
  colorscheme mustang
  set guifont=ubuntu\ Mono\ 11
endif

" display options
set guioptions-=m  "remove menubar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" line numbers
set number

" whitespaces
set list
set listchars=tab:»—,trail:·

" vertical line
set colorcolumn=80 " or set cc

" highlight current line only in current buffer
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter,FocusGained * setlocal cursorline
  au WinLeave,FocusLost * setlocal nocursorline
augroup END

" tabs and indentation

" uncomment this line to use the linux kernel style or 
" let g:use_linux_kernel_style = 1

if !exists("g:use_linux_kernel_style")
  let g:use_linux_kernel_style = 0
endif

if g:use_linux_kernel_style == 0
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab
  set smartindent
else
  setlocal tabstop=8
  setlocal shiftwidth=8
  setlocal softtabstop=8
  setlocal textwidth=80
  setlocal noexpandtab
endif

" for unknown reasons python files don't use the above global settings so
" we set them again specifically for python
autocmd Filetype python setlocal tabstop=2 softtabstop=2 shiftwidth=2
                               \ expandtab smartindent

" key settings
set timeoutlen=3000

" smar case search
set ignorecase
set smartcase


"============== Custom Keyboard Shortcuts ====================================

" Alt key workaround for termial
" map i <Esc>

" disable shortcuts that I often accidentally press
" enter visual mode
nmap Q <nop>

" --- clang format ---

" format selection
map <Leader>f :pyf /usr/share/vim/addons/syntax/clang-format-3.5.py<CR>

" format {}
map <Leader>g va{<Leader>f

" formal all file
map <Leader>F ggVG<Leader>f

" --- CScope ---

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" open in preview
nmap <C-\>S :pedit! +cs\ find\ s\ <C-R>=expand("<cword>")<CR> %<CR>
nmap <C-\>G :pedit! +cs\ find\ g\ <C-R>=expand("<cword>")<CR> %<CR>

nmap <F2> <C-\>S
nmap <F3> <C-\>G

set cscopequickfix=s-,g-,c-,d-,i-,t-,e-

" --- No plugins


" save
nmap <Leader>s :w<CR>
nmap <Leader>S :wa<CR>
" write with sudo privilege
cmap w!! w !sudo tee > /dev/null %

nmap <Leader>Q :qa<CR>

" edit files
nmap <Leader>ev :drop $MYVIMRC<CR>
nmap <Leader>em :drop Makefile<CR>

nmap <Leader>rv :so $MYVIMRC<CR>
nmap <Leader>rr :w<CR>:so %<CR>

" build
nmap <Leader>b :wa<CR>:make build<CR>
nmap <Leader><F5> :wa<CR>:make run<CR>
nmap <Leader>B :wa<CR>:make build_metadata<CR>:cs reset<CR>

nmap <Leader>c :botright copen<CR>
nmap <Leader>C :ccl<CR>

" Move line(s) up/down

nnoremap <A-k> :m .-2<CR>
nnoremap <A-j> :m .+1<CR>

vnoremap <A-k> :m '<-2<CR>gv
vnoremap <A-j> :m '>+1<CR>gv

" Duplicate line(s)

nmap <Leader>d :co+0<CR>
vmap <Leader>d :co '>+0<CR>gv

" toogle search highlight
noremap <Leader>h :set hlsearch!<CR>

" write with sudo privilege
cmap w!! w !sudo tee > /dev/null %

" autocomplete braces
inoremap {<CR> {<CR>}<Esc>O

