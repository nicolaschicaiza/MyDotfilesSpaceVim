func! myspacevim#before() abort
    let g:mapleader = ';'

    func! s:transparent_background()
        highlight Normal guibg=NONE ctermbg=NONE
        " highlight NonText guibg=NONE ctermbg=NONE
    endf
    autocmd ColorScheme * call s:transparent_background()

    " Configration SpaceVim
    let g:spacevim_wrap_line = 1
    let g:spacevim_enable_statusline_tag = 1
    let g:spacevim_enable_cursorcolumn = 1
    let g:spacevim_enable_cursorline = 1
    let g:spacevim_enable_tabline_ft_icon = 1
    let g:spacevim_enable_os_fileformat_icon = 1
    let g:indentLine_enabled = 1
    let g:indent_blankline_use_treesitter = v:true
    let g:indent_blankline_show_end_of_line =v:true
    " let g:spacevim_custom_plugins = []

    " Configuration for Github and Gist
    let g:github_dashboard = { 'username': 'nicolaschicaiza', 'password': $GITHUB_TOKEN }
    let g:gista#client#default_username = 'nicolaschicaiza'

    " Telescope key shortcuts
    call SpaceVim#custom#SPC('nnoremap', ['F', 'f'], ':Telescope find_files', 'Files query', 1)
    call SpaceVim#custom#SPC('nnoremap', ['F', 'b'], ':Telescope buffers', 'Buffers active', 1)
    call SpaceVim#custom#SPC('nnoremap', ['F', 'h'], ':Telescope help_tags', 'Helps documentation query', 1)

    " Key shortcuts Tagbar
    " call SpaceVim#custom#SPCGroupName(['f', 'B'], '+Tagbar')
    call SpaceVim#custom#SPC('nnoremap', ['f', 'E'], ':TagbarOpen', 'Open window of the tags', 1)

    " Configuration vim-translator
    let g:translator_target_lang = 'es'
    let g:translator_source_lang = 'auto'
        " Key shortcuts
        call SpaceVim#custom#SPCGroupName(['x', 'T'], '+Translator')
        call SpaceVim#custom#SPC('nnoremap', ['x', 'T', 'w'], ':TranslateW', 'Translate text in a window', 1)
        call SpaceVim#custom#SPC('vnoremap', ['x', 'T', 'w'], ":'<,'>TranslateW", 'Translate text in a window', 1)
        call SpaceVim#custom#SPC('vnoremap', ['x', 'T', 'r'], ":'<,'>TranslateR", 'Replace the current text with the translation', 1)
        call SpaceVim#custom#SPC('nnoremap', ['x', 'T', 't'], ':Translate', 'Translate text under the cursor', 1)
        call SpaceVim#custom#SPC('vnoremap', ['x', 'T', 't'], ":'<,'>Translate", 'Translate text under the cursor', 1)

    " Configuration NERDTree
    let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ 'Modified'  :'✹',
            \ 'Staged'    :'✚',
            \ 'Untracked' :'✭',
            \ 'Renamed'   :'➜',
            \ 'Unmerged'  :'═',
            \ 'Deleted'   :'✖',
            \ 'Dirty'     :'✗',
            \ 'Ignored'   :'☒',
            \ 'Clean'     :'✔︎',
            \ 'Unknown'   :'?',
            \ }

    " Configuration VimTex
    let g:vimtex_format_enabled = 1
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_context_pdf_viewer = 'zathura'
    let g:vimtex_view_general_viewer = 'zathura'

    " Configuration Floaterm
    let g:floaterm_keymap_toggle = '<F12>'
    let g:floaterm_width = 0.8
    let g:floaterm_height = 0.8

    " Configuration Browser-Search
    call SpaceVim#custom#SPCGroupName(['s', 'w'], '+Browser')
    call SpaceVim#custom#SPC('nnoremap', ['s', 'w', 's'], ':BrowserSearch', 'Browser search engines', 1)
    call SpaceVim#custom#SPC('vnoremap', ['s', 'w', 's'], ";'<,'>BrowserSearch", 'Browser search engines', 1)

    " Configuration Scrollbar
    augroup ScrollbarInit
        autocmd!
        autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
        autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
        autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
    augroup end
    let g:scrollbar_winblend = 1

    " Configuration Grammarous 
    call SpaceVim#custom#SPCGroupName(['x', 'G'], '+Grammar')
    call SpaceVim#custom#SPC('nnoremap', ['x', 'G', 's'], ':GrammarousCheck --lang=es', 'Check spanish grammar', 1)
    call SpaceVim#custom#SPC('nnoremap', ['x', 'G', 'e'], ':GrammarousCheck --lang=en', 'Check english grammar', 1)
    call SpaceVim#custom#SPC('inoremap', ['x', 'G', 's'], ":'<,'>GrammarousCheck --lang=es", 'Check spanish grammar', 1)
    call SpaceVim#custom#SPC('inoremap', ['x', 'G', 'e'], ":'<,'>GrammarousCheck --lang=en", 'Check english grammar', 1)
    call SpaceVim#custom#SPC('nnoremap', ['x', 'G', 'l'], ':GrammarousReset', 'Reset the current check', 1)
    call SpaceVim#custom#SPC('nnoremap', ['x', 'G', 'f'], ":execute 'normal \<Plug>(grammarous-fixit)'", 'Fix the error automatically', 1)
    call SpaceVim#custom#SPC('nnoremap', ['x', 'G', 'F'], '\F', "Fix all the error automatically", 1)
    call SpaceVim#custom#SPC('nnoremap', ['x', 'G', 'n'], '\n', "Move to the next error's location", 1)
    call SpaceVim#custom#SPC('nnoremap', ['x', 'G', 'p'], '\p', "Move to the previous error's location", 1)
    call SpaceVim#custom#SPC('nnoremap', ['x', 'G', 'r'], '\r', "Remove the error without fix", 1)
    call SpaceVim#custom#SPC('nnoremap', ['x', 'G', 'R'], '\R', "Disable the grammar rule in the checked buffer", 1)
    call SpaceVim#custom#SPC('nnoremap', ['x', 'G', 'o'], '\o', "Open the info window for the errors", 1)
    let g:grammarous#hooks = {}
    function! g:grammarous#hooks.on_check(errs) abort
        nmap \n <Plug>(grammarous-move-to-next-error)
        nmap \p <Plug>(grammarous-move-to-previous-error)
        nmap \f <Plug>(grammarous-fixit)
        nmap \F <Plug>(grammarous-fixall)
        nmap \r <Plug>(grammarous-remove-error)<Plug>(grammarous-move-to-next-error)
        nmap \R <Plug>(grammarous-disable-error)
        nmap \o <Plug>(grammarous-open-info-window)
    endfunction

    function! g:grammarous#hooks.on_reset(errs) abort
        nunmap \n
        nunmap \p
    endfunction

    " Configuration Coc -- Autocomplete language server
    call SpaceVim#custom#SPC('nnoremap', ['b', 'F'], ':CocCommand prettier.formatFile', 'format code by Coc', 1)
    call SpaceVim#custom#SPC('nnoremap', ['f', 'e'], ':CocCommand explorer', 'coc explorer filesmanager', 1)
    let g:coc_global_extensions = ['coc-tsserver', 'coc-emmet', 'coc-tslint', 'coc-prettier', 'coc-json', 'coc-sh', 'coc-highlight', 'coc-texlab', 'coc-vimtex', 'coc-git', 'coc-diagnostic', 'coc-calc', 'coc-github', 'coc-svg', 'coc-ltex', 'coc-python']
    autocmd CursorHold * silent call CocActionAsync('highlight')

   " Configuration IndentBlankline
    let g:indentLine_enabled = v:true
    let g:indent_blankline_enabled = v:true
    let g:indent_blankline_show_current_context = v:true
    let g:indent_blankline_filetype = []
    let g:indent_blankline_char_list = ['|', '¦', '┆', '┊']
    let g:indent_blankline_char_highlight_list = ['Function']
    " let g:indent_blankline_space_char_highlight_list = ['Error', 'Function']
    " let g:indent_blankline_space_char_blankline_highlight_list = ['Error', 'Function']
    let g:indent_blankline_context_highlight_list = ['Error', 'Warning']
    let g:indent_blankline_context_pattern_highlight = {'function': 'Function'}
    let g:indent_blankline_disable_warning_message = v:true
    let g:indent_blankline_debug = v:true
    " let g:indent_blankline_show_first_indent_level = v:false
    let g:indent_blankline_filetype_exclude = ['help', 'startify']
    autocmd VimEnter * IndentBlanklineEnable!

    " Configuration Auto-Pairs
    let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '```':'```', '"""':'"""', "'''":"'''"}
    let g:AutoPairsShortcutFastWrap = '<C-e>'

    
    
endf

func! myspacevim#after() abort
    " Congurations of Vim
    set spell spelllang=es,en
    set list
    " inoremap {<CR> {<CR>}<Esc>O
    " inoremap [<CR> [<CR>]<Esc>O
    set termguicolors

    " Only 10 suggestions spell 
    set spellsuggest=best,25
    inoremap <silent>zp <C-x>s
    nnoremap <silent>zp a<C-x>s
    inoremap <silent>zg <Esc>zga

    " Bookmarks management
    nnoremap <silent><Leader>m m

    au FileType tex setlocal wrap


endf


