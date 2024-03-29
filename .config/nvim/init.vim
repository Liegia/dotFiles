set encoding=UTF-8
set number
set spelllang=en_us
set spell
let mapleader = "," " map leader to , (comma)

" True Color Support if it's avaiable in terminal
if has("termguicolors")
    set termguicolors
endif

syntax on
syntax enable


" *---- Search configuration ----*
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase


" *---- Tab and Indent configuration ----*
set expandtab
set tabstop=4
set shiftwidth=4


" Install vim-plug first with:
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

call plug#begin(stdpath('data') . '/plugged')

		Plug 'http://www.github.com/junegunn/vim-github-dashboard.git'
		Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
		Plug 'junegunn/fzf.vim'
		Plug 'junegunn/limelight.vim'
		Plug 'junegunn/goyo.vim'
		Plug 'preservim/nerdtree'
		Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight'
		Plug 'ryanoasis/vim-devicons'
		Plug 'https://github.com/tpope/vim-commentary'
		Plug 'liuchengxu/vista.vim'
		Plug 'jeetsukumaran/vim-pythonsense'
		Plug 'jiangmiao/auto-pairs'
		" Plug 'itchyny/lightline.vim' "Like airline but less dependencies
		Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
		Plug 'Vimjas/vim-python-pep8-indent'
		Plug 'dense-analysis/ale'
		Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'tmux-plugins/vim-tmux'
		Plug 'vim-syntastic/syntastic'
        Plug 'preservim/tagbar'
		Plug 'tpope/vim-markdown'
        Plug 'rust-lang/rust.vim'
		" *---- Color-schemes ----*
		Plug 'morhetz/gruvbox' 
        Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'
		Plug 'arcticicestudio/nord-vim', { 'branch': 'develop'  }
		Plug 'junegunn/seoul256.vim'
		Plug 'joshdick/onedark.vim'
    	Plug 'kristijanhusak/vim-hybrid-material'
    	Plug 'NLKNguyen/papercolor-theme'
	    Plug 'ajh17/Spacegray.vim'
    	Plug 'chriskempson/base16-vim'
		Plug 'morhetz/gruvbox'
		Plug 'sainnhe/gruvbox-material'



" Initialize plugin system
call plug#end()

" NERDTree stuff
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" Automatically close NERDTree when you open a file
let NERDTreeQuitOnOpen=1

" FZF stuff
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Vista Stuff
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()


" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }


let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" Semshi Stuff
nmap <silent> <leader>rr :Semshi rename<CR>

nmap <silent> <C-Tab> :Semshi goto name next<CR>
nmap <silent> <S-Tab> :Semshi goto name prev<CR>

nmap <silent> <leader>c :Semshi goto class next<CR>
nmap <silent> <leader>C :Semshi goto class prev<CR>

nmap <silent> <leader>f :Semshi goto function next<CR>
nmap <silent> <leader>F :Semshi goto function prev<CR>

nmap <silent> <leader>gu :Semshi goto unresolved first<CR>
nmap <silent> <leader>gp :Semshi goto parameterUnused first<CR>

nmap <silent> <leader>ee :Semshi error<CR>
nmap <silent> <leader>ge :Semshi goto error<CR>


" ALE Stuff
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['prettier'],
      \   'css': ['prettier'],
      \   'markdown': ['prettier'],
      \}

let g:ale_fixers = {
      \   'python': ['yapf'],
      \   'javascript': ['prettier'],
      \   'css': ['prettier'],
      \   'markdown': ['prettier'],
      \}
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1


" Coc Stuff
" Go to definition
nmap <silent> gd <Plug>(coc-definition)
" Displaying documentation in the floating window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Smart rename.
nmap <leader>rn <Plug>(coc-rename) 
" Tab for completion
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>" 
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

set showcmd



" *---- Color Themes ----*
set termguicolors " Enables nvim more than 256 colors

" let g:onedark_italic=1
" colorscheme onedark
let g:nord_italic=1
colorscheme nord
"let g:gruvbox_italic=1 " Lookgs good with Fantasque Sans Mono or Fira Mono font.
"let g:gruvbox_transparent_bg=1
"colorscheme gruvbox
" colorscheme gruvbo-material
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE

" Sett filetypes.
"au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
"au BufNewFile,BufFilePre,BufRead *.py set filetype=Python
"au BufNewFile,BufFilePre,BufRead *.pY set filetype=python

" Coc-Prittier settings
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Airline stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='nord_minimal'
"let g:airline_theme='gruvbox'

" Syntax stuff
	let g:asmsyntax = 'nasm'

" Wildmenu
set wildmenu
set wildmode=longest:full,full

" *----Key Bindings----*
imap jj <Esc>
imap jk <Esc>
nnoremap <C-A> <Esc>

nnoremap <leader><ENTER> :Goyo<CR>

nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

set splitbelow
set splitright

nnoremap <Up> :resize +2<CR> 
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>


map <F1> :colorscheme gruvbox<CR> :hi Normal guibg=NONE ctermbg=NONE <CR>
map <F2> :colorscheme nord<CR> :hi Normal guibg=NONE ctermbg=NONE <CR>
map <F3> :colorscheme onedark<CR> :hi Normal guibg=NONE ctermbg=NONE <CR>
map <F4> :colorscheme seoul256<CR> :hi Normal guibg=NONE ctermbg=NONE <CR>
map <F5> :colorscheme PaperColor<CR> :set background=light <CR> :hi Normal guibg=NONE ctermbg=NONE <CR>
"map <F6> :colorscheme base16-default-dark<CR>

nmap <F8> :TagbarToggle<CR>

" Syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8', 'pylint']
let g:syntastic_always_populate_loc_list = 1




" *---- Goyo and Limelight stuff ----*
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

"Goyo settings
function! s:goyo_enter()
    set noshowmode
    set noshowcmd
    set nocursorline
    CocDisable
    Limelight
endfunction

function! s:goyo_leave()
    set showmode
    set showcmd
    set cursorline
    CocEnable
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave() 

" *---- On save stuff ----*
let g:rustfmt_autosave = 1

