" ==========================================
" bundle 插件管理和配置项
" ################### 包依赖 #####################
" package dependence:  ctags, ag(he_silver_searcher)
" python dependence:   pep8, pyflake

" language messages zh_CN.utf-8
" ***plugin need utf-8***
set encoding=utf-8

" 非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
filetype off " required! turn off
" ################### 插件管理 ###################
" inspired by spf13, 自定义需要的插件集合
if !exists('g:bundle_groups')
    " let g:bundle_groups=['python', 'javascript', 'markdown', 'html', 'css', 'tmux', 'beta', 'json', 'nginx', 'golang', 'ruby', 'less', 'php', 'coffeescript']
    " let g:bundle_groups=['python', 'javascript', 'markdown', 'html', 'css', 'tmux', 'beta']
	let g:bundle_groups=['python', 'javascript', 'markdown', 'html', 'css', 'beta']
endif
" ----------------------------------------------------------------------------
" 使用 vim-plug 管理插件
" https://github.com/junegunn/vim-plug
" PlugInstall [name ...] [#threads]	Install plugins
" PlugUpdate [name ...] [#threads]	Install or update plugins
" PlugClean[!]	Remove unused directories (bang version will clean without prompt)
" PlugUpgrade	Upgrade vim-plug itself
" PlugStatus	Check the status of plugins
" PlugDiff	Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]	Generate script for restoring the current snapshot of the plugins
" vim plugin bundle control, command model
" ----------------------------------------------------------------------------
"call plug#begin('~/.vim/bundle')
call plug#begin('~/vimfiles/bundle')
Plug 'pbrisbin/vim-mkdir'
Plug 'danro/rename.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" 重启 :YcmRestartServer
Plug 'Valloric/YouCompleteMe'
Plug 'davidhalter/jedi-vim'
" 自动补全单引号，双引号等
Plug 'Raimondi/delimitMate'
" 自动补全html/xml标签
Plug 'docunext/closetag.vim'
" 快速注释
Plug 'scrooloose/nerdcommenter'
" 快速加入修改环绕字符
Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'
" 快速去行尾空格 [, + <Space>]
Plug 'bronson/vim-trailing-whitespace'
" 快速赋值语句对齐
Plug 'junegunn/vim-easy-align'
"更高效的移动 [,, + w/fx/h/j/k/l]
Plug 'Lokaltog/vim-easymotion'

" 更高效的行内移动, f/F/t/T, 才触发
" Plug 'unblevable/quick-scope'
Plug 'vim-scripts/matchit.zip'
" 显示marks - 方便自己进行标记和跳转
Plug 'kshenoy/vim-signature'
" 选中区块
Plug 'terryma/vim-expand-region'
" 多光标选中编辑

Plug 'terryma/vim-multiple-cursors'
" 文件搜索
Plug 'ctrlpvim/ctrlp.vim' | Plug 'tacahiroy/ctrlp-funky'
Plug 'dyng/ctrlsf.vim'
" quick run
Plug 'thinca/vim-quickrun'
" git
Plug 'tpope/vim-fugitive'
" gitgutter
Plug 'airblade/vim-gitgutter'
" gundo
" edit history, 可以查看回到某个历史状态
Plug 'sjl/gundo.vim'
" 状态栏增强展示
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
" 括号显示增强
Plug 'kien/rainbow_parentheses.vim'
" 主题 solarized molokai solarized peaksea
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-scripts/peaksea'
Plug 'scrooloose/nerdtree' | Plug 'jistr/vim-nerdtree-tabs'
Plug 'szw/vim-ctrlspace'
Plug 'majutsushi/tagbar'
" text object
" 支持自定义文本对象
Plug 'kana/vim-textobj-user'
" 增加行文本对象: l   dal yal cil
Plug 'kana/vim-textobj-line'
" 增加文件文本对象: e   dae yae cie
Plug 'kana/vim-textobj-entire'
" 增加缩进文本对象: i   dai yai cii - 相同缩进属于同一块
Plug 'kana/vim-textobj-indent'

if count(g:bundle_groups, 'markdown')
    Plug 'plasticboy/vim-markdown', {'for': 'md'}
    " https://github.com/suan/vim-instant-markdown
    " npm -g install instant-markdown-d
    " Plug 'suan/vim-instant-markdown'
    " let g:instant_markdown_slow = 1
    " let g:instant_markdown_autostart = 0
    " map <F12> :InstantMarkdownPreview<CR>
endif

if count(g:bundle_groups, 'python')
    " for python.vim syntax highlight
    " pythonsyntax
    Plug 'hdima/python-syntax'
    Plug 'hynek/vim-python-pep8-indent'
    Plug 'Glench/Vim-Jinja2-Syntax'
endif

if count(g:bundle_groups, 'javascript')
    " javascript
    " 注意: syntax这个插件要放前面
    Plug 'othree/yajs.vim' | Plug 'pangloss/vim-javascript'
    " Plug 'jelera/vim-javascript-syntax' | Plug 'pangloss/vim-javascript'
    " TODO: jquery? for, remove or keep
    Plug 'othree/javascript-libraries-syntax.vim'
    let g:used_javascript_libs = 'jquery,underscore,backbone'

    " for javascript 自动补全, 配合YCM, 需要安装全局环境的（非nvm中) node.js&npm
    " 安装完成后还需要在 bundle/tern_for_vim 下执行 npm install 安装依赖
    " see https://github.com/marijnh/tern_for_vim
    " Plug 'marijnh/tern_for_vim'
endif


if count(g:bundle_groups, 'json')
    " json
    Plug 'elzr/vim-json', {'for': 'json'}
endif

if count(g:bundle_groups, 'css')
    " css
    " not work in iterm2 which termianl selection is not xterm-256, and it slow
    " Plug 'ap/vim-css-color'
    " 这个有坑, see issue https://github.com/wklken/k-vim/issues/49
    " Plug 'gorodinskiy/vim-coloresque'
endif


if count(g:bundle_groups, 'html')
    " ###### emmet HTML complete #########
    " Plug "mattn/emmet-vim"
endif

" this is just for beta version
if count(g:bundle_groups, 'beta')
    " indent
    Plug 'nathanaelkane/vim-indent-guides'
    " <leader>ig to trigger
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black
endif

Plug 'amix/vim-zenroom2'
Plug 'junegunn/goyo.vim'

call plug#end()

" ################### 基础 ######################

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> ,z :Goyo<cr>
" nnoremap <silent><Space>z :Goyo<cr>
"" for lightline
set cmdheight=2
" syntastic {{{
    let g:syntastic_error_symbol='>>'
    let g:syntastic_warning_symbol='>'
    let g:syntastic_check_on_open=1
    let g:syntastic_check_on_wq=0
    let g:syntastic_enable_highlighting=1
    " 最轻量
    " let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes
    " 中等
    " error code: http://pep8.readthedocs.org/en/latest/intro.html#error-codes
    let g:syntastic_python_checkers=['pyflakes', 'pep8'] " 使用pyflakes,速度比pylint快
    let g:syntastic_python_pep8_args='--ignore=E501,E225,E124,E712,E402'
    " 重量级, 但是足够强大, 定制完成后相当个性化
    " pylint codes: http://pylint-messages.wikidot.com/all-codes
    " let g:syntastic_python_checkers=['pyflakes', 'pylint'] " 使用pyflakes,速度比pylint快
    " let g:syntastic_python_checkers=['pylint'] " 使用pyflakes,速度比pylint快
    " let g:syntastic_python_pylint_args='--disable=C0111,R0903,C0301'

    " if js
    " let g:syntastic_javascript_checkers = ['jsl', 'jshint']

    " to see error location list
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_enable_signs = 1
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_auto_jump = 0
    let g:syntastic_loc_list_height = 5

    function! ToggleErrors()
        let old_last_winnr = winnr('$')
        lclose
        if old_last_winnr == winnr('$')
            " Nothing was closed, open syntastic_error location panel
            Errors
        endif
    endfunction
    nnoremap <Leader>s :call ToggleErrors()<cr>

    " ,en ,ep to jump between errors
    function! <SID>LocationPrevious()
    try
        lprev
    catch /^Vim\%((\a\+)\)\=:E553/
        llast
    endtry
    endfunction

    function! <SID>LocationNext()
    try
        lnext
    catch /^Vim\%((\a\+)\)\=:E553/
        lfirst
    endtry
    endfunction

    nnoremap <silent> <Plug>LocationPrevious    :<C-u>exe 'call <SID>LocationPrevious()'<CR>
    nnoremap <silent> <Plug>LocationNext        :<C-u>exe 'call <SID>LocationNext()'<CR>
    nmap <silent> <Leader>sp    <Plug>LocationPrevious
    nmap <silent> <Leader>sn    <Plug>LocationNext

    " 修改高亮的背景色, 适应主题
    "highlight SyntasticErrorSign guifg=white guibg=black

    " 禁止插件检查java
    " thanks to @marsqing, see https://github.com/wklken/k-vim/issues/164
    let g:syntastic_mode_map = {'mode': 'active', 'passive_filetypes': ['java'] }
" }}}

" ################### 自动补全 ###################
" jedi  {{{
" https://github.com/davidhalter/jedi-vim
"   Completion <C-Space>
    " Goto assignments <leader>g (typical goto function)
    " Goto definitions <leader>d (follow identifier as far as possible, includes imports and statements)
    " Show Documentation/Pydoc K (shows a popup with assignments)
    " Renaming <leader>r
    " Usages <leader>n (shows all the usages of a name)
    " Open module, e.g. :Pyimport os (opens the os module)
    " (:help jedi-vim)
    " default
    " let g:jedi#goto_command = "<leader>d"
    " let g:jedi#goto_assignments_command = "<leader>g"
    " let g:jedi#goto_assignments_command = "<F3>"
    " let g:jedi#goto_definitions_command = ""
    let g:jedi#goto_definitions_command = "<F3>"
    " let g:jedi#documentation_command = "K"
    " let g:jedi#usages_command = "<leader>n"
    " let g:jedi#completions_command = "<C-Space>"
    let g:jedi#completions_command = "<C-p>"
    let g:jedi#completions_command = "Tab"
    " let g:jedi#rename_command = "<leader>r"
    " default
" }}}

" YouCompleteMe {{{
    "youcompleteme  默认tab  s-tab 和自动补全冲突
    let g:ycm_key_list_select_completion = ['<Down>']
    let g:ycm_key_list_previous_completion = ['<Up>']
    let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
    let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
    let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
    let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
    let g:ycm_collect_identifiers_from_tags_files = 1
    " 开启语法关键字补全
    let g:ycm_seed_identifiers_with_syntax=1
    "let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全, 不过python关键字都很短，所以，需要的自己打开
    " 跳转到定义处, 分屏打开
    " let g:ycm_goto_buffer_command = 'horizontal-split'
    let g:ycm_goto_buffer_command = 'vertical-split'
    nnoremap <F3> :YcmCompleter GoToDefinition<CR>
    nnoremap <m-k> :YcmCompleter GoToDefinitionElseDeclaration<CR>
    nnoremap <leader>k :YcmCompleter GoToDeclaration<CR>
    " 引入，可以补全系统，以及python的第三方包 针对新老版本YCM做了兼容
    " old version
    if !empty(glob("~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"))
        let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
    endif
    " new version
    if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
        let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
    endif
    " 直接触发自动补全 insert模式下
    " let g:ycm_key_invoke_completion = '<C-Space>'
    " 黑名单,不启用
    let g:ycm_filetype_blacklist = {
        \ 'tagbar' : 1,
        \ 'gitcommit' : 1,
        \}
" }}}

" ultisnips {{{
    let g:UltiSnipsExpandTrigger       = "<tab>"
    let g:UltiSnipsJumpForwardTrigger  = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    let g:UltiSnipsSnippetDirectories  = ['UltiSnips']
    "let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
	let g:UltiSnipsSnippetsDir = '~/vimfiles/UltiSnips'
    map <leader>us :UltiSnipsEdit<CR>
    " ctrl+j/k 进行选择
    func! g:JInYCM()
        if pumvisible()
            return "\<C-n>"
        else
            return "\<c-j>"
        endif
    endfunction

    func! g:KInYCM()
        if pumvisible()
            return "\<C-p>"
        else
            return "\<c-k>"
        endif
    endfunction
    inoremap <c-j> <c-r>=g:JInYCM()<cr>
    au BufEnter,BufRead * exec "inoremap <silent> " . g:UltiSnipsJumpBackwordTrigger . " <C-R>=g:KInYCM()<cr>"
    let g:UltiSnipsJumpBackwordTrigger = "<c-k>"
" }}}

" delimitMate {{{
    " for python docstring ",优化输入
    au FileType python let b:delimitMate_nesting_quotes = ['"']
    au FileType php let delimitMate_matchpairs = "(:),[:],{:}"
    " 关闭某些类型文件的自动补全
    "au FileType mail let b:delimitMate_autoclose = 0
" }}}

" closetag {{{
    let g:closetag_html_style=1
" }}}
" ################### 快速编码 ###################
" nerdcommenter {{{
    map <leader>m <Plug>NERDCommenterToggle
    map <m-/> <Plug>NERDCommenterToggle
    let g:NERDSpaceDelims=1
    let g:NERDAltDelims_python = 1
" }}}
" trailingwhitespace {{{
    map <leader><space> :FixWhitespace<cr>
" }}}
" easyalign {{{
    vmap <Leader>a <Plug>(EasyAlign)
    nmap <Leader>a <Plug>(EasyAlign)
    if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
    endif
    let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
" }}}

" ################### 快速移动 ###################
" easymotion {{{
    let g:EasyMotion_smartcase = 1
    "let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
    map <Space>h <Plug>(easymotion-linebackward)
    map <Space>j <Plug>(easymotion-j)
    map <Space>k <Plug>(easymotion-k)
    map <Space>l <Plug>(easymotion-lineforward)
    " 重复上一次操作, 类似repeat插件, 很强大
    map <Space>. <Plug>(easymotion-repeat)
" }}}


" quickscope {{{
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" }}}
" ################### 快速选中 ###################
" expandregion {{{
    " map + <Plug>(expand_region_expand)
    " map _ <Plug>(expand_region_shrink)
    vmap v <Plug>(expand_region_expand)
    vmap V <Plug>(expand_region_shrink)
    " Extend the global default
    call expand_region#custom_text_objects({
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ 'ii' :0,
      \ 'ai' :0,
      \ })
" }}}
" multiplecursors {{{
    let g:multi_cursor_use_default_mapping=0
    " Default mapping
    let g:multi_cursor_next_key='<C-m>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
" }}}ctrlpfunky
" ################### 功能相关 ###################
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ag searching and cope displaying
"    requires ag.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ag after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
" Open Ag and put the cursor in the right position
map <leader>a :Ag
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>
" Do :help cope if you are unsure what cope is. It's super useful!
" When you search with Ag, display your results in cope by doing:
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ctrlp  ctrlpfunky{{{
    let g:ctrlp_map = ',P'
    " let g:ctrlp_map = '<m-P>'
    let g:ctrlp_cmd = 'CtrlP'
    map ,f :CtrlPMRU<CR>
    map <leader>b :CtrlPBuffer<cr>
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
        \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
        \ }
    let g:ctrlp_working_path_mode='ra'
    let g:ctrlp_match_window_bottom=1
    let g:ctrlp_max_height=25
    let g:ctrlp_match_window_reversed=0
    let g:ctrlp_mruf_max=500
    let g:ctrlp_follow_symlinks=1
    let g:ctrlp_max_files = 0
    " let g:ctrlp_funky_after_jump = 'zxzt'

    " ctrlpfunky
    " ctrlp插件1 - 不用ctag进行函数快速跳转
    nnoremap <Space>f :CtrlPFunky<Cr>
	nnoremap <m-[> :CtrlPFunky<Cr>
    " narrow the list down with a word under cursor
	nnoremap <m-]> :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
    let g:ctrlp_funky_syntax_highlight = 1
    let g:ctrlp_extensions = ['funky']
" }}},

" ctrlsf {{{
    let g:ctrlsf_ackprg = 'ag'    " 设置ctrlsf 使用ag
        nmap ,` <Plug>CtrlSFCwordPath<CR>
	nmap <Space>w <Plug>CtrlSFCwordPath<CR>
    " let g:ctrlsf_position = 'below'
    " let g:ctrlsf_winsize = '30%'
    let g:ctrlsf_auto_close = 0
    let g:ctrlsf_confirm_save = 0
    let g:ctrlsf_default_root = 'project+fw'

    " Note: cannot use <CR> or <C-m> for open
    " Use : <sapce> or <tab>
    let g:ctrlsf_mapping = {
        \ "open"  : "<Space>",
        \ "openb" : "O",
        \ "tab"   : "t",
        \ "tabb"  : "T",
        \ "prevw" : "p",
        \ "quit"  : "q",
        \ "next"  : "<C-J>",
        \ "prev"  : "<C-K>",
        \ "pquit" : "q",
        \ }
" }}}

" git.  git操作还是习惯命令行,vim里面处理简单diff编辑操作
" fugitive {{{
    " :Gdiff  :Gstatus :Gvsplit
    nnoremap <leader>ge :Gdiff<CR>
    " not ready to open
    " <leader>gb maps to :Gblame<CR>
    " <leader>gs maps to :Gstatus<CR>
    " <leader>gd maps to :Gdiff<CR>  和现有冲突
    " <leader>gl maps to :Glog<CR>
    " <leader>gc maps to :Gcommit<CR>
    " <leader>gp maps to :Git push<CR>
" }}}

" gitgutter {{{
    " 同git diff,实时展示文件中修改的行
    " 只是不喜欢除了行号多一列, 默认关闭,gs时打开
    let g:gitgutter_map_keys = 0
    let g:gitgutter_enabled = 0
    let g:gitgutter_highlight_lines = 1
    nnoremap <leader>gs :GitGutterToggle<CR>
" }}}

" gundo {{{
    noremap <leader>h :GundoToggle<CR>
" }}}

" ################### 显示增强 ###################

" airline {{{
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    " let g:airline_left_sep = '▶'
    " let g:airline_left_alt_sep = '❯'
    " let g:airline_right_sep = '◀'
    " let g:airline_right_alt_sep = '❮'
    " let g:airline_symbols.linenr = '¶'
    " let g:airline_symbols.branch = '⎇'
    " 是否打开tabline
    " let g:airline#extensions#tabline#enabled = 1
" }}}

" rainbow_parentheses {{{
    " 不加入这行, 防止黑色括号出现, 很难识别
    " \ ['black',       'SeaGreen3'],
    let g:rbpt_colorpairs = [
        \ ['brown',       'RoyalBlue3'],
        \ ['Darkblue',    'SeaGreen3'],
        \ ['darkgray',    'DarkOrchid3'],
        \ ['darkgreen',   'firebrick3'],
        \ ['darkcyan',    'RoyalBlue3'],
        \ ['darkred',     'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['brown',       'firebrick3'],
        \ ['gray',        'RoyalBlue3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['Darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['darkred',     'DarkOrchid3'],
        \ ['red',         'firebrick3'],
        \ ]

    let g:rbpt_max = 16
    let g:rbpt_loadcmd_toggle = 0
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
" }}}

" ################### 显示增强-主题 ###################"

" solarized {{{
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    " let g:solarized_termcolors=256
" }}}

" molokai {{{
    " monokai原始背景色
   " let g:molokai_original = 1
   " let g:rehash256 = 1
" }}}

" ################### 快速导航 ###################
" nerdtree nerdtreetabs {{{

    let NERDTreeHighlightCursorline=1
    let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
    "close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
    " s/v 分屏打开文件
    let g:NERDTreeMapOpenSplit = 's'
    let g:NERDTreeMapOpenVSplit = 'v'
    " nerdtreetabs
    " 关闭同步
    let g:nerdtree_tabs_synchronize_view=0
    let g:nerdtree_tabs_synchronize_focus=0
    " 是否自动开启nerdtree
    " thank to @ListenerRi, see https://github.com/wklken/k-vim/issues/165
    let g:nerdtree_tabs_open_on_console_startup=0
    let g:nerdtree_tabs_open_on_gui_startup=0
    " 打开当前文件的Tree
    map ,n <esc>:NERDTreeToggle<CR>
    inoremap ,n :NERDTreeToggle<CR>
    " nerdtreetabs
    map <F1> :NERDTreeToggle<cr>
    inoremap <F1> <esc> :NERDTreeToggle<cr>
    map <Space>nn :NERDTreeToggle<cr>
    map <Space>nb :NERDTreeFromBookmark
    map <Space>nf :NERDTreeFind<cr>
    map <m-n> :NERDTreeFind<cr>

" }}}

" Vim Workspace Controller
" ctrlspace {{{
    nnoremap <silent><m-space> :CtrlSpace<CR>
    nnoremap <silent><Leader>o :CtrlSpace<CR>
    nnoremap <silent>,o :CtrlSpace<CR>
    let g:airline_exclude_preview = 1
    hi CtrlSpaceSelected guifg=#586e75 guibg=#eee8d5 guisp=#839496 gui=reverse,bold ctermfg=10 ctermbg=7 cterm=reverse,bold
    hi CtrlSpaceNormal   guifg=#839496 guibg=#021B25 guisp=#839496 gui=NONE ctermfg=12 ctermbg=0 cterm=NONE
    hi CtrlSpaceSearch   guifg=#cb4b16 guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
    hi CtrlSpaceStatus   guifg=#839496 guibg=#002b36 gui=reverse term=reverse cterm=reverse ctermfg=12 ctermbg=8
" }}}

" 标签导航
" tagbar {{{
    nmap <F9> :TagbarToggle<CR>
    map <m-o> :TagbarToggle<CR>
    let g:tagbar_autofocus = 1
    " let g:tagbar_autoshowtag = 1
    " let g:tagbar_show_visibility = 1
    " for ruby
    let g:tagbar_type_ruby = {
        \ 'kinds' : [
            \ 'm:modules',
            \ 'c:classes',
            \ 'd:describes',
            \ 'C:contexts',
            \ 'f:methods',
            \ 'F:singleton methods'
        \ ]
    \ }
" ################### 语言相关 ###################
" quickrun {{{
    let g:quickrun_config = {
    \   "_" : {
    \       "outputter" : "message",
    \   },
    \}

    let g:quickrun_no_default_key_mappings = 1
    nmap <Space>r <Plug>(quickrun)
    map <F10> :QuickRun<CR>
" }}}

" pythonsyntax {{{
    let python_highlight_all = 1
" }}}
" markdown {{{
    let g:vim_markdown_folding_disabled=1
" }}}
" javascript {{{
    " pangloss/vim-javascript
    let g:html_indent_inctags = "html,body,head,tbody"
    let g:html_indent_script1 = "inc"
    let g:html_indent_style1 = "inc"
" }}}
" json {{{
    let g:vim_json_syntax_conceal = 0
" }}}

" ####### temp #######
" beta {{{
    " python code format
    " format all file
    autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
    " format select block
    " autocmd FileType python vnoremap <leader>y :!yapf<Cr>

     " Plug 'mindriot101/vim-yapf'
     " scriptencoding utf-8
     " let g:yapf_style = "google"
     " let g:yapf_style = "pep8"
     " " setenv PYTHONIOENCODING UTF-8
     " nnoremap <leader>y :call Yapf()<cr>
" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ ['lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }


"------------------------------------------- end of configs --------------------------------------------
" Set extra options when running in GUI mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
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
