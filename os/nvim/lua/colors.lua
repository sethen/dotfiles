vim.api.nvim_exec(
    [[
        colorscheme material
        highlight CocErrorSign gui=bold guibg=#212121 guifg=#ff5370
        highlight CocHighlightText gui=bold guibg=white guifg=black
        highlight CocInfoHighlight gui=bold guibg=#212121 guifg=#ffcb6b
        highlight CocInfoSign gui=bold guibg=#212121 guifg=#ffcb6b
        highlight CursorLine guibg=#212121
        highlight CursorLineNr gui=bold guibg=#212121 guifg=#89ddff
        highlight FernGitStatusIndex guifg=#c3e88d
        highlight FernGitStatusWorktree guifg=#ff5370
        highlight Folded gui=bold guibg=#212121 guifg=#546e7a
        highlight LineNr guifg=#546e7a
        highlight SignifySignAdd gui=bold guibg=#212121 guifg=#c3e88d
        highlight SignifySignChange gui=bold guibg=#212121 guifg=#ffcb6b
        highlight SignifySignDelete gui=bold guibg=#212121 guifg=#ff5370
        highlight VertSplit guifg=#263238
    ]], false)