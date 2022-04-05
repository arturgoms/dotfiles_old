-- Tips
-- Shift+arrow in insert mode will move to the next word
-- Multiline editing can be done by selecting the lines with <c-v> and then capital i to edit
-- You can copy the last edition by pressing .
-- <c-shift-+> will increase the font inside vim the same for the -

-- Navigation
-- moving between buffers(tabs): <s-h> and <s-l>
-- moving between windows: <c-j> and <c-l>
-- create a new tab: :tabnew %
-- move between tabs: gt

-- Files
-- Add files: a
-- Add dire: a + / at the end
-- Rename: r
-- Delete: d

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

lvim.builtin.which_key.mappings["o"] = {
  name = "+Open",
  t = {"<cmd>ToggleTerm<cr>", "Terminal" }
}

lvim.builtin.terminal.execs = {{"lazygit", "og", "LazyGit"}, {"lazydocker", "od", "LazyDocker"}}

-- Deafult things
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    command = "shellcheck",
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell", filetypes = { "javascript", "python" },
  },
}

-- Formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
}

-- Hide virtual text: use gl instead
lvim.lsp.diagnostics.virtual_text = false

-- Additional Plugins
lvim.plugins = {
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  },
  { 
    "projekt0n/github-nvim-theme"
  },
  {
    "zah/nim.vim"
  },
  {
    "github/copilot.vim"
  },
  {
   "folke/trouble.nvim",
   requires = "kyazdani42/nvim-web-devicons",
   config = function()
     require("trouble").setup {}
   end
  },
  {
    'rose-pine/neovim',
    as = 'rose-pine',
    tag = 'v1.*',
    config = function()
        vim.cmd('colorscheme rose-pine')
    end
  }
}

-- Github copilot stuff
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

local cmp = require "cmp"
lvim.builtin.cmp.mapping["<Tab>"] = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  else
    local copilot_keys = vim.fn["copilot#Accept"]()
    if copilot_keys ~= "" then
      vim.api.nvim_feedkeys(copilot_keys, "i", true)
    else
      fallback()
    end
  end
end

