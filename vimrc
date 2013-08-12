
execute pathogen#infect()

syntax on
set number

filetype on
filetype plugin indent on

filetype plugin on
set nocp
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#CompleteCpp
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

set tags+=~/.vim/tags/cpp

colorscheme wombat256

"Start first vim call with NERDTRee
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
let g:NERDTreeWinSize=22

let NERDTreeIgnore = ['\.pyc$', '\.class$', '\.git$']

set scrolloff=3
set tabstop=4
set shiftwidth=4


"SingleCompile Key
nmap <F10> :SCCompileRun<cr>

"TagbarToggle key
nmap <F11> :TagbarToggle<CR>

"Window Navigation with Alt+Arrow
nmap <silent> <S-I> :wincmd k<CR>
nmap <silent> <S-K> :wincmd j<CR>
nmap <silent> <S-J> :wincmd h<CR>
nmap <silent> <S-L> :wincmd l<CR>

" resize horzontal split window
nmap <C-I> <C-W>-<C-W>-
nmap <C-K> <C-W>+<C-W>+
" resize vertical split window
nmap <C-L> <C-W>><C-W>>
nmap <C-J> <C-W><<C-W><


"Syntastic setup
let g:syntastic_check_on_open = 1

"Tagbar setup
let g:tagbar_width = 26

"Enable help or preview window to show at the top of screen
set completeopt+=preview


"############################################
"##############    YCM setup   ##############
"############################################
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/tools/cpp/.ycm_extra_conf.py'

"############################################
"############ UltiSnips setup ###############
"############################################
" Forces Tab to be used for both YCM and UtilSnips
" let g:UltiSnipsExpandTrigger = '<c-l>'
" let g:UltiSnipsJumpForwardTrigger = '<c-l>'
" let g:UltiSnipsJumpBackwardTrigger = '<c-p>'
" let g:UltiSnipsListSnippets = '<c-m>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"

function! g:UltiSnips_Complete()
   
	call UltiSnips_JumpForwards()
	if g:ulti_jump_forwards_res == 0
		call UltiSnips_ExpandSnippet()
    	if g:ulti_expand_res == 0
        	if pumvisible()
            	return "\<C-n>"
        	else 
	            return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"



"Function to automatically close vim if NERDTree is the only window left
function! NERDTreeQuit()
	redir => buffersoutput
	silent buffers
	redir END
"				1BufNo 2Mods.		3File			4LineNo
	let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
	let windowfound = 0

	for bline in split(buffersoutput, "\n")
		let m = matchlist(bline, pattern)

		if (len(m) > 0)
			if (m[2] =~ '..a..')
				let windowfound = 1
			endif
		endif
	endfor
	
	if(!windowfound)
		quitall
	endif
endfunction
autocmd WinEnter * call NERDTreeQuit()




