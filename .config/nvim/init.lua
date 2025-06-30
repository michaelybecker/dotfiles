-- Netrw settings
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 60

-- VimWiki config
vim.g.vimwiki_list = {{
  path = '~/dev/wiki/',
  syntax = 'markdown',
  ext = '.md'
}}

-- Key mappings
local keymap = vim.keymap.set

-- Vimwiki Diary navigation
keymap('n', '<leader>wt', ':VimwikiDiaryIndex<CR>')
keymap('n', '<leader>wk', ':VimwikiDiaryPrevDay<CR>')
keymap('n', '<leader>wj', ':VimwikiDiaryNextDay<CR>')

-- Telescope mappings
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- Window/split settings
vim.opt.equalalways = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.compatible = false

-- Basic settings
vim.cmd('syntax on')
vim.opt.history = 9999
vim.opt.undolevels = 9999

-- Install lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin setup
require("lazy").setup({
  { "junegunn/fzf", build = function() vim.fn["fzf#install"]() end },
  "junegunn/fzf.vim",
  "sheerun/vim-polyglot",
  "junegunn/seoul256.vim",
  "tpope/vim-surround",
  "tomtom/tcomment_vim",
  "ghifarit53/tokyonight-vim",
  "vimwiki/vimwiki",
  { "iamcco/markdown-preview.nvim", build = "cd app && npx --yes yarn install" },
  "Raimondi/delimitMate",
  "kyuhi/vim-emoji-complete",
  "ryanoasis/vim-devicons",
  "tpope/vim-fugitive",
  "nvim-lua/plenary.nvim",
  { "nvim-telescope/telescope.nvim", tag = "0.1.8" },
  "nvim-telescope/telescope-media-files.nvim",
  "3rd/image.nvim"
})

-- Theme settings
vim.opt.termguicolors = true
vim.g.tokyonight_transparent_background = 1
vim.cmd('colorscheme tokyonight')

-- UI settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.title = true
vim.opt.scrolloff = 7
vim.opt.cursorline = true

-- Window settings
vim.opt.winwidth = 84
vim.opt.winheight = 5
vim.opt.winminheight = 5
vim.opt.winheight = 999

-- Search settings
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmatch = true

-- Fold settings
vim.opt.foldenable = true
vim.opt.foldlevelstart = 2
vim.opt.foldnestmax = 10

-- File settings
vim.opt.fileencoding = 'utf-8'
vim.opt.fileformats = 'unix,dos,mac'
vim.opt.autoread = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Indentation
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Tab completion
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest,full'
vim.opt.wildignore = '*.o,*~,*.pyc,node_modules/**,.git/**'

-- Mouse and clipboard
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

-- Status line
vim.opt.laststatus = 2
vim.opt.showmode = true
vim.opt.cmdheight = 1

-- Telescope media files setup
require('telescope').load_extension('media_files')

-- Image.nvim setup
require('image').setup{
  backend = "kitty",
  integrations = {
    markdown = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      filetypes = { "markdown", "vimwiki" },
    },
    neorg = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      filetypes = { "norg" },
    },
  },
  max_width = nil,
  max_height = nil,
  max_width_window_percentage = nil,
  max_height_window_percentage = 50,
  kitty_method = "normal",
}