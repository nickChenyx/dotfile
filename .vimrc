call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Plug 'SirVer/ultisnips'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'

Plug 'skywind3000/asyncrun.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" colorscheme gruvbox
Plug 'morhetz/gruvbox'

call plug#end()

let mapleader=","

nnoremap <leader>w :w!<CR>
nnoremap <leader>ss :source ~/.vimrc<CR>
nnoremap <leader>ee :vs ~/.vimrc<CR>

" enable true color
set termguicolors
let g:gruvbox_termcolors=16

" airline config
let g:airline#extensions#tabline#enabled = 1

let NERDTreeShowHidden=1
map <C-t> :NERDTreeToggle<CR>
nnoremap <leader>ff :NERDTreeFind<CR>

" disable ctrlp, <c-p> shortkey use by other more useful plugin
let g:ctrlp_map = '<c-+>'
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$'
    \ }

" Sets how many lines of history VIM has to remember
set history=500

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Turn on the Wild menu
set wildmenu
" default wildmode is full
"set wildmode=full

" Ignore compiled files
set wildignore+=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Add a bit extra margin to the left
set foldcolumn=1
" fold by syntax
set foldmethod=syntax


" Enable syntax highlighting
syntax enable
syntax on

filetype plugin indent on

" use vim plugin must enable
set nocompatible

" show line number
set nu

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme desert
catch
endtry

set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" TextEdit might fail if hidden is not set.
" :h hidden see more
set hidden

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowritebackup
set nowb
set noswapfile

" auto save file
set autowrite

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space><space> /
map <C-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" work for Command mode, <Up> & <Down> iterate histroy and match specified prefix
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Remap VIM 0 to first non-blank character
map 0 ^

" jump cursor to last Insert mode exit.
" nmap <S-j> `^

" delete without yank
nnoremap <leader>d \"_d
xnoremap <leader>d \"_d

" yank with register
nnoremap <leader>ay \"ay
vnoremap <leader>ay \"ay
nnoremap <leader>by \"by
vnoremap <leader>by \"by

" yank&paste fast to register a & p
" nnoremap ta \"ayiw
" nnoremap pa \"ap
" nnoremap tb \"byiw
" nnoremap pb \"bp

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f<space>  <Plug>(coc-format-selected)
nmap <leader>f<space>  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" %:h show current file path relative working dir
" see help :h ::h
" see :pwd print working dir
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

" Programe golang
" nmap <leader>got :call asyncrun#run("", {"mode":"term","pos":"bottom","rows":10,"focus":0}, "go test")<cr>
nmap <leader>got :AsyncRun -mode=term -pos=bottom -rows=10 -focus=0 -save=1 go test<cr>
nmap <leader>gor :AsyncRun -mode=term -pos=bottom -rows=10 -focus=0 -save=1 go run "%:p"<cr>

" automatically open quickfix window when AsyncRun command is executed 
" set the quickfix window 8 lines height 
let g:asyncrun_open = 8
" ring the bell to notify you job finished
let g:asyncrun_bell = 1
" F10 to toggle quickfix window
nnoremap <F12> :call asyncrun#quickfix_toggle(6)<cr>

" 人力计算 
nnoremap <leader>pd :%call ProjectPDSum()<cr>
vnoremap <leader>pd :call ProjectPDSum()<cr>

" map <C-n> :cnext<CR>
" map <C-m> :cprevious<CR>
" nnoremap <leader>a :cclose<CR>
" autocmd FileType go nmap <leader>b  <Plug>(go-build)
" autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
" run sync don't use
" autocmd FileType go nmap <leader>r  <Plug>(go-run)
" autocmd FileType go nmap <leader>o  <Plug>(go-imports)
" autocmd FileType go nmap <leader>t  <Plug>(go-test)
" autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
" autocmd FileType go nmap <Leader>i <Plug>(go-info)
" autocmd FileType go nmap <C-e> :GoDef<cr>
" autocmd FileType go nmap <C-i> :GoDefPop<cr>
" autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
" autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
" autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
" autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" cursor in go file, <C-t> not working, conflict TODO resolve
" autocmd FileType go nmap <C-t> :NERDTreeToggle<CR>
let g:go_def_mapping_enabled=0
" enable debug log
" let g:go_def_mode='gopls'
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 0
let g:go_addtags_transform = "camelcase"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
" use quickfix replace localtion lists
let g:go_list_type = "quickfix"
let g:go_decls_includes = "func,type"
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
" enable gopls debug log
" let g:go_debug = ['lsp']

"""
" function
"""
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" 人力计算
function! ProjectPDSum() range
    let sum = 0.0
    " for debug, :messages - show messages history
    " echom "Got here"
    for l in range( a:firstline + 0, a:lastline + 0 )
        " 写在每行末尾一个数字，可以是 0.5 这样的小数
        let pd = matchstr(getline(l), '\zs\(\d\+.\)\?\d\+\ze$')
        " echom "line: " . l . ", pd: " . pd
        if !empty(pd)
            let sum = sum + str2float(pd)
        endif
    endfor
    echom "line:" . a:firstline . "~" . a:lastline . " - " . printf(sum) . " person day"
    " echo sum
    "" return sum
endfunction
