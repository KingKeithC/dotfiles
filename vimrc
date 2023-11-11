" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 2 spaces
set ts=2

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 2 spaces
set shiftwidth=2

" show a visual line under the cursor's current line
"set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" YAML fun
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
