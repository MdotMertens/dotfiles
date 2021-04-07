let mapleader="\<Space>"
inoremap nm <ESC>

tnoremap <leader>qq <C-\><C-n>
nnoremap <leader>u :UndotreeShow<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>n :wincmd j<CR>
nnoremap <leader>e :wincmd k<CR>
nnoremap <leader>i :wincmd l<CR>

nnoremap <Leader>sv :vsplit<CR>
nnoremap <Leader>sh :split<CR>

nnoremap <silent> <Leader>= :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <silent> <Leader>h= :resize +5<CR>
nnoremap <silent> <Leader>h- :resize -5<CR>


nnoremap <leader>ga :Git add %:p <CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gf :Gdiff<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

" Debugger Mappings
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GoToWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GoToWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GoToWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GoToWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GoToWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GoToWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>dr :call vimspector#Reset()<CR>
nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nnoremap <leader>nt :FloatermNew<CR>
nnoremap <leader>tt :FloatermToggle<CR>
tnoremap <leader>nt <C-\><C-n>:FloatermNew<CR>
tnoremap <leader>tt <C-\><C-n>:FloatermToggle<CR>
tnoremap <leader>tn <C-\><C-n>:FloatermNext<CR>
tnoremap <leader>tp <C-\><C-n>:FloatermPrev<CR>

nmap <leader>dh <Plug>VimspectorStepInto
nmap <leader>dn <Plug>VimspectorStepOver
nmap <leader>di <Plug>VimspectorStepOut
nnoremap <leader>cd :call vimspector#Continue()<CR>

nmap <leader>dgc <Plug>VimspectorRunToCursor
nmap <leader>bp <Plug>VimspectorToggleBreakpoint
nmap <leader>cbp <Plug>VimspectorToggleConditionalBreakpoint

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
