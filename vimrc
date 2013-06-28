
execute pathogen#infect()

syntax on

set number

filetype plugin indent on

colorscheme wombat256

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

set tabstop=4
set shiftwidth=4


"Function to map both YCM and Ultisnips to <TAB>
function! g:UltiSnips_Complete()
	call UltiSnips_ExpandSnippet()
	if g:ulti_expand_res == 0
		if pumvisible()
			return "\<C-n>"
		else
			call UltiSnips_JumpForwards()
			if g:ulti_jump_forwards_res == 0
				return "\<TAB>"
			endif
		endif
	endif
	return ""
endfunction

au BufEnter * exec "inoremap <silent" . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

let g:UltiSnipsJumpForwardTrigger="<tab>"

