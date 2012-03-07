set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()

function MyDiff()
	let opt = '-a --binary '
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	let arg1 = v:fname_in
	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	let arg2 = v:fname_new
	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	let arg3 = v:fname_out
	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	let eq = ''
	if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
			let cmd = '""' . $VIMRUNTIME . '\diff"'
			let eq = '"'
		else
			let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"==================================================="
"                 Custom Settings (Mayank) 
"==================================================="

let s:ruby_path = 'C:\Ruby192\bin'
let g:slimv_swank_cmd = '!start "c:/Program Files (x86)/LispCabinet/bin/ccl/wx86cl.exe" -l "c:/Program Files (x86)/LispCabinet/site/lisp/slime/start-swank.lisp"' 

"" Auto Reloading vimrc file
    " augroup reloadVimrc 
    "     au!
        " au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
    "      au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC
    " augroup END
    
"" code folding settings 
    set foldmethod=indent
    set foldnestmax=10
    set nofoldenable
    set foldlevel=1
    set foldcolumn=3 

    " Fold Toggle function
        function FoldToggle()
            if &foldenable
                set nofoldenable
                set foldcolumn=0
            else
                set foldenable
                set foldcolumn=3
            endif
        endfunction

    " zi toggles fold columns
        nnoremap <silent>zi :call FoldToggle()<CR>

""Tab Settings
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab

""Other Important Settings
    set scrolloff=3  "lines below and above cursor
    set autoindent
    set showmode
    set showcmd
    set hidden
    set wildmenu
    "set wildmode=list:longest
    set visualbell
    set cursorline
    set ttyfast
    set ruler
    set backspace=indent,eol,start
    set laststatus=2
    set relativenumber
    set undofile
    set nocompatible
    set backspace=indent
    set copyindent
    set shiftround
    " au FocusLost * :wa  "save all files on losing focus

    set listchars=tab:>\ ,trail:.,eol:¬
    nmap <leader>l :set list!<cr>
    
""Search Related
    " nnoremap / /\v
    " vnoremap / /\v
    set ignorecase
    set smartcase
    " set gdefault  "applies substitutions globally
    set incsearch
    set showmatch
    set hlsearch
    nmap <silent> ,/ :set nohls!<CR>


""Long lines of code handling
    set nowrap
    "set wrap
    "set textwidth=79
    set formatoptions=qrn1
    "set colorcolumn=85

""Backup and swap files settings
    set nobackup
    set nowritebackup
    set noswapfile

""Disabling Arrow keys
    nnoremap <up> <nop>
    nnoremap <down> <nop>
    nnoremap <right> <nop>
    nnoremap <left> <nop>
    inoremap <up> <nop>
    inoremap <down> <nop>
    inoremap <right> <nop>
    inoremap <left> <nop>

""" Key Mapping 
    inoremap ii <Esc>  
    nnoremap ; :

    " Open Vimrc File 
        " nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>   
        nnoremap <leader>ev :e $MYVIMRC<cr>   
    
    "Working with split windows
        nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
        nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
        " open vertical split
            nnoremap <leader>w <C-w>v<C-w>l 
        " Movement b\w split windows
            nnoremap <C-h> <C-w>h
            nnoremap <C-j> <C-w>j
            nnoremap <C-k> <C-w>k
            nnoremap <C-l> <C-w>l
            
""Color Scheme and font settings
    " colors Mustang
    colors Clouds_Midnight
    "colors molokai
    "colors twilight2
    set guifont=Envy_Code_R:h10

""GuiOptions
    set guioptions-=T    "remove toolbar
    "set guioptions-=M    "remove menu bar


"" Auto Completion settings
"set completeopt=longest,menuone

"
"inoremap <expr> <CR> pumvisible() ? "\


"==========================================================================="
""""""""""""""""""""""""""""""" Plugins Settings """"""""""""""""""""""""""""
"==========================================================================="

"=========================================================="
"           Pathogen Plugin settings
"=========================================================="
    call pathogen#infect()
    syntax on
    filetype plugin indent on
"=========================================================="
"           Lusty Juggler Vim -- Buffer Plugin
"=========================================================="
    map <leader>b <leader>lj
"=========================================================="
"           Gundo Vim -- Undo Plugin
"=========================================================="
    nnoremap <F1> :GundoToggle<CR>
"=========================================================="
"         Sessions.vim plugin settings                     " 
"=========================================================="
    let g:session_autoload = 'no'
    let g:session_autosave = 'no'
    let g:session_default_to_last = 'no'
"=========================================================="
"        NeoCompltCache Plugin --- AutoComplete
"=========================================================="
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

"=========================================================="
"             Nerd Tree Settings 
"=========================================================="

    map <Leader>f :NERDTreeToggle<CR>

"=========================================================="
"            EnhancedCommentify Settings 
"=========================================================="

    let g:EnhCommentifyRespectIndent = 'Yes'
    let g:EnhCommentifyPretty = 'Yes'
    let g:EnhCommentifyUseBlockIndent= 'Yes'
    let g:EnhCommentifyMultiPartBlocks = 'Yes'
    let g:EnhCommentifyAlignRight = 'Yes'
    let g:EnhCommentifyUseSyntax = 'Yes'
    let g:EnfCommentifyUserBindings = 'Yes'
    
" key bindings
    " imap <M-c> <Esc><Plug>Commentli
    " imap <M-u> <Esc><Plug>DeCommentli
    " vmap <M-c> <Plug>VisualTraditional
    " vmap <M-c> <Plug>VisualComment
    " vmap <M-u> <Plug>VisualDeComment
    " nmap <M-c> <Plug>Commentj    
    " nmap <M-u> <Plug>DeCommentj
    " 
    " let maplocalleader=','
    " vmap <silent> <M-d> <Plug>VisualTraditional
    " nmap <silent> <M-d> <Plug>Traditional
    " let g:EnhCommentifyBindInInsert = 'No'
    " let g:EnhCommentifyMultiPartBlocks = 'Yes'
    " let g:EnhCommentifyPretty = 'Yes'
    " let g:EnhCommentifyRespectIndent = 'Yes'
    " let g:EnhCommentifyUseBlockIndent = 'Yes'
    " let g:EnhCommentifyUseSyntax = 'Yes'
    "    
"=========================================================="
"           Auto Load Vimrc changes
"=========================================================="

