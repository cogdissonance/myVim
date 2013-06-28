
execute pathogen#infect()

syntax on
set number

filetype on
filetype plugin indent on

colorscheme wombat256

"Start first vim call with NERDTRee
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

set scrolloff=3
set tabstop=4
set shiftwidth=4

"SingleCompile Key
nmap <F10> :SCCompileRun<cr>


"############################################
"###########    Syntastic setup   ###########
"############################################
let g:syntastic_check_on_open = 1

"############################################
"##############    YCM setup   ##############
"############################################
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"############################################
"############ UltiSnips setup ###############
"############################################
" Forces Tab to be used for both YCM and UtilSnips
" let g:UltiSnipsExpandTrigger = '<c-l>'
" let g:UltiSnipsJumpForwardTrigger = '<c-l>'
" let g:UltiSnipsJumpBackwardTrigger = '<c-p>'
" let g:UltiSnipsListSnippets = '<c-m>'
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"

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

