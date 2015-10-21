" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" :BundleInstall

"基本配置
set nocompatible
"vim 插件管理
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" vim plugin bundle control, command model
"     :BundleInstall     install 安装配置的插件
"     :BundleInstall!    update  更新
"     :BundleClean       remove plugin not in list 删除本地无用插件
Bundle 'gmarik/vundle'

Bundle 'DoxygenToolkit.vim'
Bundle 'scrooloose/syntastic'
" 主题 molokai
Bundle 'tomasr/molokai'
" monokai原始背景色
let g:molokai_original = 1
" 历史编辑
Bundle 'mbbill/undotree'
" 自动补全单引号，双引号等
Bundle 'Raimondi/delimitMate'
" ###### Markdown #########
Bundle 'plasticboy/vim-markdown'
Bundle 'Emmet.vim'
Bundle 'MatchTag'
Bundle 'pydoc.vim'
Bundle 'delimitMate.vim'
Bundle 'Mark--Karkat'
Bundle 'scrooloose/nerdtree'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'suan/vim-instant-markdown'
Bundle 'scrooloose/nerdcommenter'
Bundle 'pangloss/vim-javascript'
Bundle 'Lokaltog/vim-powerline'
Bundle 'othree/xml.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'majutsushi/tagbar'
Bundle 'KohPoll/vim-less'
Bundle 'lepture/vim-css'
Bundle 'wincent/command-t'

let g:vim_markdown_folding_disabled=1


"语法检测设置
filetype    on                      " 检测打开文件的类型
syntax      on                      " 开启语法高亮
syntax      enable                  " 激活语法高亮
filetype    plugin on               " 允许特定的文件类型载入插件文件
filetype    indent on               " 允许特定的文件类型载入缩进文件
" 文件类型的自动检测和设定
autocmd     BufRead,BufNewFile      *.go                    set filetype=go
autocmd     BufRead,BufNewFile      *.{md,mkd,mkdn,mark*}   set filetype=markdown
autocmd     BufRead,BufNewFile      *.tex                   set filetype=tex
" 主题
colorscheme molokai
"编码及存储
set fileencodings=utf-8             " 文件编码，强制UTF-8
set encoding=utf-8                  " vim内部编码
set nobomb                          " 不使用bom编码
set nobackup                        " 不使用备份文件
set noswapfile                      " 不产生交换文件
set autoread                        " 自动同步外部修改
" 缩进
set autoindent                      " 开启新行时，自动缩进
set smartindent                     " 开启新行时，智能缩进
set cindent                         " C程序自动缩进

" 空白
set shiftwidth=4                    " 缩进空白数
set tabstop=4                       " Tab所占空格数
set expandtab                       " 将Tab展开为空格
set softtabstop=4                   " 配合tabstop
set listchars=tab:▸\ ,trail:▫       " 指定Tab和结尾空白字符
set number                          " 显示行号
set foldlevel=99                       " 默认展开所有代码

" 状态栏/标尺
set mouse=a                          " 启用鼠标
set ruler                           " 显示行号和列号
set cursorline                      " 高亮当前行
set showcmd                         " 再屏幕最后一行显示命令
set laststatus=2                    " 始终显示状态栏
set cmdheight=1                     " 命令行使用的屏幕行数
"set statusline=%f%m%r%h%w\ [TYPE=%Y]\ [%{&fileencoding?&fileencoding:&encoding}/%{&ff}]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %l:%c\ \(%p%%\)%)

"搜索和匹配
set showmatch                       " 高亮显示匹配的括号
set matchtime=5                     " 匹配括号高亮的时间(单位是十分之一秒)
set ignorecase                      " 搜行号和列号写
set smartcase                       " 如果搜索模式包含大写字符，不使用'ignorecase'选项
set hlsearch                        " 高亮被搜索的内容
set incsearch                       " 增量搜索
set t_Co=256                        " 开启256色支持

" others
"set mouse=a                         " 所有模式下，开启鼠标支持
set wildmenu                        " 命令行补全以增强模式运行
set splitright                      " 竖直新分割的窗口在右侧
set splitbelow                      " 水平新分割的窗口在下面

" 打开上次编辑位置
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
" set paste模式
map <leader>t      :set paste<cr>

let g:python_highlight_all                  = 1
let g:python_highlight_builtin_funcs        = 1
let g:python_highlight_exceptions           = 1
let g:python_highlight_builtin_objs         = 1
let g:python_highlight_string_formatting    = 1

" DoxygenToolkit快捷键
map <Leader>da      :DoxAuthor<cr>
map <Leader>df      :Dox<cr>
map <Leader>db      :DoxBlock<cr>

" DoxygenToolkit.vim  文档插件
" :DoxLic        插入License信息
" :DoxAuthor     插入作者信息
" :Dox           插入文档注释
let g:DoxygenToolkit_authorName             = "feythin lau"
let g:DoxygenToolkit_licenseTag             = "BSD\<enter>"
let g:DoxygenToolkit_undocTag               = "DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre           = "@brief\t\t"
let g:DoxygenToolkit_paramTag_pre           = "@param\t\t"
let g:DoxygenToolkit_returnTag              = "@return\t\t"
let g:DoxygenToolkit_throwTag_pre           = "@exception\t\t"
let g:DoxygenToolkit_briefTag_funcName      = "yes"
let g:DoxygenToolkit_maxFunctionProtoLines  = 30 


" syntastic  支持多种语言的语法检查插件
"let g:syntastic_check_on_open               = 1
"let g:pep8_cmd                              = g:config_flake8_dir . 'pep8'
"let g:flake8_cmd                            = g:config_flake8_dir . 'flake8'
"let g:pyflakes_cmd                          = g:config_flake8_dir . 'pyflakes'
"let g:pylint_cmd                            = g:config_flake8_dir . 'pylint'
"let g:syntastic_python_checkers             = ['pylint', 'flake8', 'pep8', 'pyflakes']
"let g:syntastic_python_pylint_args          ="-disable-msg=C0103 --max-line-length=120"
"let g:syntastic_python_pep8_args            ="--max-line-length=120"
"let g:syntastic_python_flake8_args          ="--max-line-length=120 --max-complexity=6"                                                                                             
"let g:syntastic_always_populate_loc_list    =1

if has("gui_running")
"ubuntu---------------------------------------------------------------------
"配置字体
    set guifont=YaHei\ Consolas\ Hybrid\ 12
"开启气泡提示
    set ballooneval
    set balloondelay=100
"ubuntu---------------------------------------------------------------------
else
"OSX------------------------------------------------------------------------
"删除键
 set backspace=indent,eol,start
"OSX------------------------------------------------------------------------
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   mac os map
if has('mac') && ($TERM == 'xterm-256color' || $TERM == 'screen-256color')
map <Esc>OP <F1>
map <Esc>OQ <F2>
map <Esc>OR <F3>
map <Esc>OS <F4>
map <Esc>[16~ <F5>
map <Esc>[17~ <F6>
map <Esc>[18~ <F7>
map <Esc>[19~ <F8>
map <Esc>[20~ <F9>
map <Esc>[21~ <F10>
map <Esc>[23~ <F11>
map <Esc>[24~ <F12>
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             ctags
"
let Tlist_Ctags_Cmd='/usr/bin/ctags'
"用法：$ ctags –R src
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           nerdtree
"
"不显示帮助信息
 let NERDTreeMinimalUI=1
"鼠标点击                            
 let NERDTreeMouseMode = 2
"宽度
let g:NERDTreeWinSize = 32
"忽略文件、隐藏文件
 let NERDTreeIgnore = ['\.pyc$']
 let NERDTreeSortOrder=['\/$', 'Makefile', 'makefile', '*', '\~$']
 nmap wm :NERDTreeToggle<cr>
"关闭当前窗口
 nmap wc      <C-w>c     
 nmap wv      <C-w>v     
"分割窗口移动快捷键
 nnoremap <c-h> <c-w>h
 nnoremap <c-j> <c-w>j
 nnoremap <c-k> <c-w>k
 nnoremap <c-l> <c-w>l
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   tagbar
"
nmap tb :Tagbar<cr>
let tagbar_ctags_bin='/usr/bin/ctags'
let tagbar_width=35
let g:tagbar_compact = 1
let g:tagbar_autoshowtag = 1

"autocmd BufWinEnter *.py :TagbarOpen
"autocmd BufWinEnter *.c :TagbarOpen
"autocmd BufWinEnter *.cpp :TagbarOpen
"autocmd BufWinEnter *.js :TagbarOpen
"autocmd BufWinLeave *.py :TagbarClose
"autocmd BufWinLeave *.c :TagbarClose
"autocmd BufWinLeave *.cpp :TagbarClose
"autocmd BufWinLeave *.js :TagbarClose
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       instant- markdown
"
"依赖：
" $gem install pygments.rb
" $gem install redcarpet
" $npm -g install instant-markdown-d
"
 au BufRead,BufNewFile *.md set filetype=markdown
 let g:instant_markdown_autostart = 0
 nmap <C-p> :InstantMarkdownPreview<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 错误检查
"
"let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"set error or warning signs
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
"whether to show balloons
let g:syntastic_enable_balloons = 1

"安装flake8: easy_install flake8
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E401,E265,E302,E261,E262,E123,F403,E128'
let g:syntastic_javascript_checkers = ['jshint'] 
"let g:syntastic_javascript_jshint_exec = '/usr/bin/jshint'
'
"Default: 0
"If enabled, syntastic will do syntax checks when buffers are first loaded as
"well as on saving >
 "let g:syntastic_check_on_open=1

"Default: 0
"Enable this option to tell syntastic to always stick any detected errors into
"the loclist: >
 let g:syntastic_always_populate_loc_list=1

"Default: 2
"When set to 1 the error window will be automatically opened when errors are
"detected, and closed when none are detected. >
 let g:syntastic_auto_loc_list=1

"When set to 2 the error window will be automatically closed when no errors are
"detected, but not opened automatically. >
"let g:syntastic_auto_loc_list=2

"only errors no warnings
 let g:syntastic_quiet_messages={'level': 'warnings'}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   YouCompleteMe
"
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" 关掉补全时的预览窗口
set completeopt=longest,menu                
" 不用每次提示加载.ycm_extra_conf.py文件
let g:ycm_confirm_extra_conf = 0              
" 关闭ycm的syntastic
let g:ycm_show_diagnostics_ui = 0 

" 评论中也应用补全
let g:ycm_complete_in_comments = 1        
" 两个字开始补全
let g:ycm_min_num_of_chars_for_completion = 2   
" 开启 YCM 基于标签引擎
"let g:ycm_collect_identifiers_from_tags_files=1
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 关键字补全    
let g:ycm_seed_identifiers_with_syntax = 1
""上下左右键的行为 会显示其他信息
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-k>\<C-j>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-k>\<C-j>" : "\<PageUp>"
"set YouCompleteMe trigger key 
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
"let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
"let g:ycm_key_list_previous_completion = ['<Up>']

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif 
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    


let g:ycm_key_invoke_completion = '<Enter>'
let g:ycm_semantic_triggers =  {'c' : ['->', '.'], 'objc' : ['->', '.'], 'ocaml' : ['.', '#'], 'cpp,objcpp' : ['->', '.', '::'], 'php' : ['->', '::'], 'cs,java,javascript,vim,coffee,python,scala,go' : ['.'], 'ruby' : ['.', '::']}
autocmd BufRead *.py nnoremap <C-]> :YcmCompleter GoToDefinition<CR>
"autocmd BufRead *.py nnoremap <C-]> :YcmCompleter GoToDeclaration<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                       ultisnips
" Track the engine.
"Bundle 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Bundle 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                       pyclewn
"
 let g:pyclewn_args="--terminal=TERMINAL --window=bottom"

 autocmd BufRead *.c* map <F5>  :TagbarClose<CR> :Pyclewn<CR> :call StartDebug()<CR> :call StartDebugC()<CR> 
 autocmd BufRead *.py map <F5>  :TagbarClose<CR> :Pyclewn pdb %:p<CR> :call StartDebug()<CR> :call StartDebugPy()<CR>
 autocmd BufRead *.py nmap <F6> :!python %<CR> 
 autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
 autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
 map <F4>  :nbclose<CR> <C-j>wc :call StopDebug()<CR>

 func! StartDebug()
 map <S-b> :exe "Cbreak " . expand("%:p") . ":" . line(".")<CR>                                     
 map <S-e> :exe "Cclear " . expand("%:p") . ":" . line(".")<CR>                                     
 map <S-u> :exe "Cup "<CR>                                      
 map <S-d> :exe "Cdown "<CR>                                        
 map <S-n> :exe "Cnext "<CR>                                        
 map <S-c> :exe "Ccontinue "<CR>                                        
 map <S-s> :exe "Cstep "<CR>                                        
 map <S-f> :exe "Cfinish "<CR>                                      
 map <S-w> :exe "Cwhere "<CR>   
 map <S-l> :exe "Cinfo locals "<CR> 
 map <S-t> :exe "Cinfo break "<CR>  
 map <S-x> :exe "Cfoldvar " . line(".")<CR>  
 endfunc

 func! StartDebugC()
     map <S-z> :exe "Csigint "<CR>                                      
     map <S-a> :exe "Cinfo args "<CR>   
     map <S-r> :exe "Crun "<CR>                                     
     map <S-p> :exe "Cprint " . expand("<cword>") <CR>
     map <S-q> :exe "Cquit "<CR>                                        
 endfunc
 func! StartDebugPy()
     map <S-z> :exe "Cinterrupt "<CR>                                       
     map <S-a> :exe "Cargs "<CR>    
     map <S-r> :exe "Creturn "<CR>  
     map <S-p> :exe "Cp " . expand("<cword>") <CR>
     map <S-q> :exe "Cquit "<CR> <C-j>wc
 endfunc

 func! StopDebug()
 unmap <S-b>
 unmap <S-e>
 unmap <S-u>
 unmap <S-d>
 unmap <S-n>
 unmap <S-c>
 unmap <S-s>
 unmap <S-f>
 unmap <S-w>
 unmap <S-l>
 unmap <S-t>
 unmap <S-x>
 unmap <S-z>
 unmap <S-a>
 unmap <S-r>
 unmap <S-p>
 unmap <S-q>
 endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Emmet
"
let g:user_emmet_expandabbr_key = '<C-e>'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 CommandT
"
map <C-c> :CommandT<CR>
