" on the first run, please do git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
" compile ycm, compile cmatcher

let maplocalleader="'"

set nocompatible
filetype plugin indent off
syntax off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
endif

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

" NeoBundle 'hkjels/natural.vim'
NeoBundle 'tpope/vim-sensible'
  silent! call mkdir(expand('~/.cache//'))
  silent! call mkdir(expand('~/.cache/vim//'))

  let &directory = expand('~/.cache/vim/swap//')
  silent! call mkdir(&directory)

  let &backupdir = expand('~/.cache/vim/backup//')
  silent! call mkdir(&backupdir)

  let &undodir = expand('~/.cache/vim/undo//')
  silent! call mkdir(&undodir)

  set undofile

  set guifont=Fira_Mono:h16
  " set guifont=Consolas_For_Powerline:h18
  " set guifont=Liberation_Mono_For_Powerline:h18
  " set guifont=Anonymous_Pro_for_Powerline:h18
  " set guifont=Source_Code_Pro_for_Powerline:h18
 
  set ttimeout
  set ttimeoutlen=1

  set lbr
  set visualbell
  set nocursorline
  set ignorecase
  set noerrorbells  

  set completeopt=menuone,longest
  set complete=i,t

  set wildmenu
  set wildmode=longest:full,full
  set wildignore +=*/tmp/*,*.so,*.swp,*.zip

  set splitright
  set splitbelow

  set shiftwidth=2
  set softtabstop=2
  set expandtab
  set tabstop=2
  set virtualedit=block

  set hidden
  set scrolloff=5

  set fileformats=unix,dos,mac 
  set formatoptions+=jt
  set guioptions-=T guioptions-=e guioptions-=L guioptions-=r guioptions+=c
  set viminfo='50,<100,s100,:100,!,n~/.cache/viminfo
  set shell=zsh

  set modeline                " Allow vim options to be embedded in files;
  set modelines=5             " they must be within the first or last 5 lines.

  nnoremap j gj
  nnoremap k gk
  nnoremap î gj
  nnoremap ë gk
  nnoremap <C-e> $
  nnoremap <C-a> 0

  " Paste from clipboard
  map <leader>p "+p

  " Quit window on <leader>q
  nnoremap <leader>q :q<CR>

  " hide matches on <leader>space
  nnoremap <leader><space> :nohlsearch<cr>

  " Select the item in the list with enter
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  " Run Netrw
  nnoremap <leader>e :Explore<cr>
  let g:netrw_use_noswf= 0

" EditorConfig
NeoBundle 'editorconfig/editorconfig-vim'

" Case convertion and stuff
NeoBundle 'tpope/vim-abolish'

" Project Root
NeoBundle "dbakker/vim-projectroot"
  au BufEnter * if &ft != 'help' | call ProjectRootCD() | endif

" Toggle Cursor in supported terminals
NeoBundle 'jszakmeister/vim-togglecursor'

" 
" CtrlP
" 
NeoBundle 'JazzCore/ctrlp-cmatcher'
  let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

NeoBundle 'kien/ctrlp.vim'
  let g:ctrlp_map = ""
  let g:ctrlp_cache_dir = '~/.cache/vim/ctrp'
  let g:ctrlp_match_window = 'bottom,order:top,min:1,max:10,results:10'  
  let g:ctrlp_working_path_mode = 'rc' " search for nearest ancestor like .git, .hg, and the directory of the current file
  let g:ctrlp_by_filename = 0
  let g:ctrlp_max_height = 10          " maxiumum height of match window
  let g:ctrlp_switch_buffer = 'et'     " jump to a file if it's open already
  let g:ctrlp_use_caching = 1          " enable caching
  let g:ctrlp_clear_cache_on_exit=0    " speed up by not removing clearing cache evertime
  let g:ctrlp_mruf_max = 250           " number of recently opened files
  let g:ctrlp_key_loop = 1
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.git|\.hg|\.svn|\.build|node_modules|bower_components)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

  let g:ctrlp_buffer_func = { 'exit': 'MyPrtMappings' }
  func! MyPrtMappings()
      let g:ctrlp_prompt_mappings = {
          \ 'AcceptSelection("e")': ['<cr>'],
          \ 'AcceptSelection("t")': ['<c-t>'],
          \ }
  endfunc

  nnoremap <leader>re :CtrlPMRUFiles<cr>
  nnoremap <leader>f  :CtrlP<cr>
  nnoremap <leader>b  :CtrlPBuffer<cr>
  nnoremap <leader>c  :exec ":CtrlP " . expand("%:p:h")<cr>

" Projectionist
NeoBundle "tpope/vim-projectionist"
  nnoremap <leader>' :A<cr>

" Colors
"
NeoBundle 'zefei/cake16'
NeoBundle "vim-scripts/SlateDark"
NeoBundle 'amdt/sunset' 
  let g:sunset_latitude = 51.5
  let g:sunset_longitude = -0.1167
  let g:sunset_utc_offset = 3

  function! g:sunset_daytime_callback()
    if has("gui_running")
      colorscheme cake16
      set bg=light
    endif
  endfunction

  function! g:sunset_nighttime_callback()
    if has("gui_running")
      colorscheme SlateDark
      set bg=dark
    end
  endfunction

" Markdown
NeoBundle 'tpope/vim-markdown'
  autocmd Filetype markdown setlocal wrap
  autocmd Filetype markdown setlocal linebreak
  autocmd Filetype markdown setlocal nolist

" JS
NeoBundle 'mxw/vim-jsx'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'justinj/vim-react-snippets'
NeoBundle 'othree/javascript-libraries-syntax.vim'

" Python
NeoBundle "hdima/python-syntax"
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'davidhalter/jedi-vim'
  let g:jedi#use_tabs_not_buffers = 0
  let g:jedi#goto_assignments_command = "<leader>g"
  let g:jedi#goto_definitions_command = "<leader>d"
  let g:jedi#documentation_command = "K"
  let g:jedi#usages_command = "<leader>n"
  let g:jedi#completions_command = "<C-Space>"
  let g:jedi#rename_command = "<leader>r"
  let g:jedi#show_call_signatures = "1" 

  au FileType python setlocal completeopt-=preview
  au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4

" Gist
NeoBundle "Keithbsmiley/gist.vim"

" Tagbar
NeoBundle "majutsushi/tagbar"
  nnoremap <leader>t :TagbarToggle<cr>
  let g:tagbar_autoclose=1

" Golang
NeoBundle 'rhysd/vim-go-impl'
NeoBundle 'fatih/vim-go'
  let g:go_fmt_fail_silently = 1
  let g:go_bin_path = expand("$HOME/.gvm/pkgsets/go1.3/global/bin/")
  au FileType go set nowrap
  au FileType go nnoremap gd :GoDef<cr>
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <Leader>gd <Plug>(go-doc)
  au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
  au FileType go nmap <Leader>ds <Plug>(go-def-split)
  au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dt <Plug>(go-def-tab)

  " setup golang path
  function! s:go_change_path()
    let dirs = $GOROOT . "/src/pkg"
    let list = split($GOPATH, ':')
    for d in list
      let dirs .= "," . d . "/src"
    endfor
    let &l:path = dirs
  endfunction
  au FileType go call s:go_change_path()

" Editing
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-rsi'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'godlygeek/tabular'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'Raimondi/delimitMate'
  let g:delimitMate_expand_cr = 1
  let g:delimitMate_expand_space = 1

" Syntax
NeoBundle 'scrooloose/syntastic'
  let g:syntastic_enable_signs=1
  nnoremap <Leader>l :ll<cr>
  let g:syntastic_auto_jump = 1
  let g:syntastic_loc_list_height=5
  let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" Ruby
NeoBundle 'vim-ruby/vim-ruby'
  let g:rubycomplete_use_bundler = 1

NeoBundle "rking/ag.vim"
  set grepprg=ag\ --nogroup\ --nocolor

" Git
NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-fugitive'

" Tags
function! s:SetProperTagsFile()
  let projroot = ProjectRootGet('')

  if len(projroot)
    let &tags = projroot . "/.git/tags"
  else
    let &tags = expand("~/.cache/vim/tags")
  endif
endfunction
autocmd BufWinEnter * call s:SetProperTagsFile()

" Notes
NeoBundle 'xolox/vim-shell' 
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-notes'
  let g:notes_directories = ['~/Documents/Notes']
  let g:notes_alt_indents = 0
  let g:notes_tab_indents = 0

" Completions
NeoBundle 'Valloric/YouCompleteMe'
  let g:ycm_key_list_select_completion = ['<Down>']
  let g:ycm_min_num_of_chars_for_completion = 1
  let g:ycm_autoclose_preview_window_after_completion=1
  let g:ycm_path_to_python_interpreter = '/usr/bin/python'
  let g:ycm_use_ultisnips_completer = 1
  let g:ycm_collect_identifiers_from_tags_files=0
  nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

NeoBundle 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-j>"
  let g:UltiSnipsListSnippets="<c-tab>"
  let g:UltiSnipsSnippetDirectories = ["UltiSnips", "ultisnips-snippets"]

  au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
 
  function! g:UltiSnips_Complete()
      call UltiSnips#ExpandSnippet()
      if g:ulti_expand_res == 0
          if pumvisible()
              return "\<C-n>"
          else
              call UltiSnips#JumpForwards()
              if g:ulti_jump_forwards_res == 0
                return "\<TAB>"
              endif
          endif
      endif
      return ""
  endfunction

" LightLine
NeoBundle "itchyny/lightline.vim"

let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'mode_map': { 'n': 'N', 'i': 'I', 'R': 'R', 'v': 'v', 'V': 'V', 'c': 'c', "\<C-v>" : 'B', 's': 's', 'S': 'S', "\<C-s>" : 'S', '?': ' '},
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
  \   'right': [ [ 'syntastic', 'lineinfo' ], [ 'getcwd', 'filetype' ] ]
  \ },
  \ 'component': { 'lineinfo': '%l:%-2v' },
  \ 'component_function': {
  \   'filename': 'MyFilename',
  \   'fugitive': 'MyFugitive',
  \   'filetype': 'MyFiletype',
  \   'mode': 'MyMode',
  \   'ctrlpmark': 'CtrlPMark',
  \ },
  \ 'component_expand': {
  \   'syntastic': 'SyntasticStatuslineFlag',
  \   'getcwd': 'getcwd',
  \ },
  \ 'component_type': {
  \   'syntastic': 'error',
  \ }}

let g:lightline.separator = { 'left': '⮀', 'right': '⮂' }
let g:lightline.subseparator = { 'left': '⮁', 'right': '⮃' }

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  let fname = expand('%')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[no name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = '⭠'  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : '') : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
    \ fname == 'ControlP' ? 'CtrlP' :
    \ fname == '__Gundo__' ? 'Gundo' :
    \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
    \ fname =~ 'NERD_tree' ? 'NERDTree' :
    \ &ft == 'unite' ? 'Unite' :
    \ &ft == 'vimfiler' ? 'VimFiler' :
    \ &ft == 'vimshell' ? 'VimShell' :
    \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp,*.go call s:syntastic()
augroup END

function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

call neobundle#end()
  NeoBundleCheck
  filetype plugin indent on 
  syntax on

augroup vimrcEx
  autocmd!

  autocmd BufRead,BufNewFile {Vagrantfile,Guardfile,Gemfile,Rakefile,Capfile,*.rake,config.ru,*.rb} set ft=ruby
  autocmd BufWritePre        {Vagrantfile,Guardfile,Gemfile,Rakefile,Capfile,*.rake,config.ru,*.rb} :%s/\s\+$//e
  autocmd BufRead,BufNewFile {*.coffee.erb}                                                         set ft=coffee
  autocmd BufRead,BufNewFile {*.md,*.mkd,*.markdown}                                                set ft=markdown 
  autocmd BufRead,BufNewFile {*.md}                                                                 setlocal spell textwidth=80
  autocmd BufRead,BufNewFile {COMMIT_EDITMSG}                                                       set ft=gitcommit
  autocmd BufRead,BufNewFile {*.clj,*.cljs}                                                         set ft=clojure
  autocmd BufRead,BufNewFile {*.json}                                                               set ft=javascript
  autocmd BufRead,BufNewFile {*.hbs}                                                                set ft=handlebars

  autocmd GuiEnter * set columns=140 lines=80 number

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END
