"==============
" Basic Settings
" ==============
set number " line numbers
set wildmenu " tab auto completion
set wildmode=list:full " show tab automplete list
set cmdheight=2 " height of command bar
set statusline=%f " show filename
set laststatus=2 " make statusline visible
set ignorecase " ignore case when searching
set smartcase " casematch if pattern contains an uppercase letter
set expandtab " spaces instead of tabs
set tabstop=4 " default to 4 spaces per tab
set shiftwidth=4 " indent 4 spaces
set autoindent " auto indent
set nobackup " no backup files
set nowritebackup " no backup file while editing
set noswapfile " no swap files
set scrolloff=5 " place 5 lines above/below cursor on searches
set ffs=unix " use Unix as the standard file type
set hlsearch " highlight all search matches

" =================
" Advanced Settings
" =================

" resize splits when window is resized
au VimResized * exe "normal! \<c-w>="

" ============
" Color Scheme
" ============
syntax on " syntax highlighting
colorscheme desert " default color scheme

" line numbers color
:highlight LineNr ctermfg=red

" ======
" Syntax
" ======

" highlight lines that are too long
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
autocmd BufWrite *.py match OverLength /\%81v.*/
autocmd BufWrite *.md match OverLength /\%81v.*/
autocmd BufWrite *.js match OverLength /\%101v.*/
autocmd BufWrite *.jsx match OverLength /\%101v.*/
autocmd BufWrite *.ts match OverLength /\%101v.*/
autocmd BufWrite *.tsx match OverLength /\%101v.*/

" highlight exra whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax *.py syn match ExtraWhitespace /\s\+$\| \+\ze\t/
:autocmd Syntax *.js syn match ExtraWhitespace /\s\+$\| \+\ze\t/
:autocmd Syntax *.jsx syn match ExtraWhitespace /\s\+$\| \+\ze\t/
:autocmd Syntax *.ts syn match ExtraWhitespace /\s\+$\| \+\ze\t/
:autocmd Syntax *.tsx syn match ExtraWhitespace /\s\+$\| \+\ze\t/
:autocmd Syntax *.hb syn match ExtraWhitespace /\s\+$\| \+\ze\t/
:autocmd Syntax *.html syn match ExtraWhitespace /\s\+$\| \+\ze\t/
:autocmd Syntax *.md syn match ExtraWhitespace /\s\+$\| \+\ze\t/
:autocmd Syntax *.yaml syn match ExtraWhitespace /\s\+$\| \+\ze\t/
:autocmd Syntax *.sls syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" remove extra whitespaces on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.jsx :call DeleteTrailingWS()
autocmd BufWrite *.ts :call DeleteTrailingWS()
autocmd BufWrite *.tsx :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" misc file-type syntax highlighting
"autocmd BufRead,BufNewFile *.hb setlocal syntax=html
"autocmd BufRead,BufNewFile *.scss setlocal syntax=css
"autocmd BufRead,BufNewFile *.less setlocal syntax=css
au BufNewFile,BufRead *.hb set filetype=html
au BufNewFile,BufRead *.scss set filetype=css
au BufNewFile,BufRead *.less set filetype=css

" file-type specific indentation
au BufEnter *.py set ai sw=4 ts=4 sta et
au BufEnter *.html set ai sw=2 ts=2 sta et
au BufEnter *.hb set ai sw=2 ts=2 sta et
au BufEnter *.js set ai sw=2 ts=2 sta et
au BufEnter *.jsx set ai sw=2 ts=2 sta et
au BufEnter *.ts set ai sw=2 ts=2 sta et
au BufEnter *.tsx set ai sw=2 ts=2 sta et
au BufEnter *.ts set ai sw=2 ts=2 sta et
au BufEnter *.sass set ai sw=2 ts=2 sta et
au BufEnter *.scss set ai sw=2 ts=2 sta et
au BufEnter *.less set ai sw=2 ts=2 sta et
au BufEnter *.css set ai sw=4 ts=4 sta et
au BufEnter *.conf set ai sw=4 ts=4 sta et
au BufEnter *.json set ai sw=2 ts=2 sta et

" =============
" Miscellaneous
" =============

" breakpoint shortcuts
:ab pdb import pdb; pdb.set_trace() #XXX
:ab pudb import pudb; pudb.set_trace() #XXX

" replace windows newlines
:command Dw %s/\s\+$\| \+\ze\t//g
:command Dn %s/\r$

" press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" hit F2 key to show tabs and endlines
:set noexpandtab
:nnoremap <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>

" Syntastic for hooking up jshint to vim
execute pathogen#infect()
" let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_check_on_open = 1
" let g:syntastic_error_symbol = '!'
" let g:syntastic_warning_symbol = '?'

" Set up Typescript highlighting (assuming v8+)
" git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/pack/typescript/start/typescript-vim
" https://github.com/leafgarland/typescript-vim
