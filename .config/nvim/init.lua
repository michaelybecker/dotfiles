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

-- Oil.nvim file manager
keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Vimwiki Diary navigation
keymap('n', '<leader>wt', ':VimwikiDiaryIndex<CR>')
keymap('n', '<leader>wk', ':VimwikiDiaryPrevDay<CR>')
keymap('n', '<leader>wj', ':VimwikiDiaryNextDay<CR>')

-- Telescope mappings
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- Fugitive shortcut
-- Interactive version that prompts for commit message
local function quick_commit_push()
    vim.ui.input({ prompt = 'Commit message: ' }, function(commit_msg)
        if commit_msg and commit_msg ~= '' then
            vim.cmd('Git add -A')
            vim.cmd('Git commit -m "' .. commit_msg .. '"')
            vim.cmd('Git push')
        end
    end)
end

-- Create the command
vim.api.nvim_create_user_command('WikiCommit', quick_commit_push, {})

-- Set the keymap
vim.keymap.set('n', '<leader>co', ':WikiCommit<CR>', { noremap = true, silent = true })

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
  {
    "edluffy/hologram.nvim",
    config = function()
      require('hologram').setup{
        auto_display = true
      }
    end
  },
  "nvim-tree/nvim-web-devicons",
  "stevearc/oil.nvim",
  "tris203/precognition.nvim"
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
if vim.opt.modifiable:get() then
  vim.opt.fileencoding = 'utf-8'
end
vim.opt.fileformats = 'unix,dos,mac'
vim.opt.autoread = true
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


-- Precognition setup
require("precognition").setup({})

-- Oil.nvim setup
require("oil").setup({
  default_file_explorer = true,
  columns = {
    "icon",
    "permissions",
    "size",
    "mtime",
  },
  buf_options = {
    buflisted = false,
    bufhidden = "hide",
  },
  win_options = {
    wrap = false,
    signcolumn = "no",
    cursorcolumn = false,
    foldcolumn = "0",
    spell = false,
    list = false,
    conceallevel = 3,
    concealcursor = "nvic",
  },
  delete_to_trash = false,
  skip_confirm_for_simple_edits = false,
  prompt_save_on_select_new_entry = true,
  cleanup_delay_ms = 2000,
  lsp_file_methods = {
    timeout_ms = 1000,
    autosave_changes = false,
  },
  constrain_cursor = "editable",
  experimental_watch_for_changes = false,
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-s>"] = "actions.select_vsplit",
    ["<C-h>"] = "actions.select_split",
    ["<C-t>"] = "actions.select_tab",
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = "actions.close",
    ["<C-l>"] = "actions.refresh",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = "actions.tcd",
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g."] = "actions.toggle_hidden",
    ["g\\"] = "actions.toggle_trash",
  },
  use_default_keymaps = true,
  view_options = {
    show_hidden = false,
    is_hidden_file = function(name, bufnr)
      return vim.startswith(name, ".")
    end,
    is_always_hidden = function(name, bufnr)
      return false
    end,
  },
  float = {
    padding = 2,
    max_width = 0,
    max_height = 0,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
    override = function(conf)
      return conf
    end,
  },
  preview = {
    max_width = 0.9,
    min_width = { 40, 0.4 },
    width = nil,
    max_height = 0.9,
    min_height = { 5, 0.1 },
    height = nil,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
  },
  progress = {
    max_width = 0.9,
    min_width = { 40, 0.4 },
    width = nil,
    max_height = { 10, 0.9 },
    min_height = { 5, 0.1 },
    height = nil,
    border = "rounded",
    minimized_border = "none",
    win_options = {
      winblend = 0,
    },
  },
})
