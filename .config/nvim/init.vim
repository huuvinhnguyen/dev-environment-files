set runtimepath^=~/.config/nvim
source ~/.config/nvim/lua/init.lua

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Install plugins with vim-plug https://github.com/junegunn/vim-plug
" Reload and runs :PlugInstall to install plugins

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'mileszs/ack.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'slim-template/vim-slim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'tpope/vim-rails'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'Shougo/deoplete.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'

" Rails Debugger

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wingrunr21/vscode-ruby'

Plug 'mfussenegger/nvim-dap'
Plug 'suketa/nvim-dap-ruby'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mfussenegger/nvim-dap-python'
Plug 'rcarriga/nvim-dap-ui-controls'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'mfussenegger/nvim-dap-ruby'

Plug 'rcarriga/nvim-dap-ui'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'mfussenegger/nvim-dap-ruby'

Plug 'chrisbra/csv.vim'
Plug 'sindrets/diffview'
Plug 'tpope/vim-fugitive'

Plug 'sindrets/neoformat'


" End rails debugger

" Uncomment if you want to enable Github copilot plugin
" Plug 'github/copilot.vim'

call plug#end()

" Use The Silver Searcher if available
" https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
endif

" -- Configurations --

" Enable syntax highlighting
syntax on

" Don't wrap long lines
set nowrap

" Use 2 spaces for tabs
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set clipboard=unnamedplus

" Automatically remove all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Set default colorscheme to solarized
" set background=dark
" silent! colorscheme solarized8_high

" Enable line numbers and don't make them any wider than necessary
set number numberwidth=2

" Enable syntax highlighting for Rails
au FileType ruby,eruby,ruby.erb set filetype=ruby.rails
au FileType yaml set filetype=yaml.rails

" Enable code folding
set foldmethod=syntax
set foldlevel=1

" -- Mappings --

" Toggle NERDTreeToggle
nmap <Leader>g :NERDTreeToggle<CR>
nmap <Leader>r :NERDTreeRefreshRoot


" Switch between panes
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l

" Mapping CtrlP command
nnoremap <Leader>b :<C-U>CtrlPBuffer<CR>
nnoremap <Leader>t :<C-U>CtrlP<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" Config for dap-ruby

lua <<EOF
  local dap = require('dap')
  dap.adapters.ruby = {
    type = 'executable',
    command = 'bundle',
    args = {'exec', 'rdebug-ide', '--host', '0.0.0.0', '--port', '1234'},
  }

  dap.configurations.ruby = {
    {
      type = 'ruby',
      request = 'attach',
      name = 'Attach to running Ruby process',
      host = '127.0.0.1',
      port = 1234,
      -- Change this to the path to your ruby executable if using a virtual environment
      -- runtimeArgs = {'-r', 'dotenv', '-e', 'puts ENV["RUBY_EXECUTABLE"]'},
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      -- Use 'stopOnEntry=true' to start debugging from the beginning of the script
      -- stopOnEntry = true,
    },
  }
EOF

