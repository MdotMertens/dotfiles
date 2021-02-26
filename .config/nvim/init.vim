source $HOME/.config/nvim/Windows.vim
source $HOME/.config/nvim/Plug.vim
source $HOME/.config/nvim/Vimtex.vim

let mapleader="\<Space>"
inoremap nm <ESC>

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set nu rnu
set scrolloff=10
set cot=menuone,noinsert,noselect shm+=c


syntax on
colorscheme nord 
set termguicolors
hi LineNr ctermbg=NONE guibg=NONE

let g:diagnostic_virtual_text_prefix = ''
let g:diagnostic_enable_virtual_text = 1

let g:completion_confirm_key = "\<C-y>"
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_matching_smart_case = 1
let g:completion_trigger_on_delete = 1

:lua << EOF
  local nvim_lsp = require('lspconfig')
  local on_attach = function(_, bufnr)
    require('completion').on_attach()
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xd', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
  end
  local servers = {'pyright', 'vimls', 'jdtls'}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
    }
  end

  require('telescope').setup{
    defaults = {
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    }
  }

EOF

highlight ColorColumn ctermbg=0 guibg=lightgrey


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

nmap <leader>dh <Plug>VimspectorStepInto
nmap <leader>dn <Plug>VimspectorStepOver
nmap <leader>di <Plug>VimspectorStepOut
nnoremap <leader>cd :call vimspector#Continue()<CR>

nmap <leader>dgc <Plug>VimspectorRunToCursor
nmap <leader>bp <Plug>VimspectorToggleBreakpoint
nmap <leader>cbp <Plug>VimspectorToggleConditionalBreakpoint

