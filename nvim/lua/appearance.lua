--[[
 ________              _  __     _         ___
/_  __/ /  ___ ___    / |/ /  __(_)_ _    / _ | ___  ___  ___ ___ ________ ____  _______
 / / / _ \/ -_) _ \  /    / |/ / /  ' \  / __ |/ _ \/ _ \/ -_) _ `/ __/ _ `/ _ \/ __/ -_)
/_/ /_//_/\__/\___/ /_/|_/|___/_/_/_/_/ /_/ |_/ .__/ .__/\__/\_,_/_/  \_,_/_//_/\__/\__/
                                             /_/  /_/
--]]

-- {{{ Theme Settings
require("onedark").setup({
  style = "cool",
  transparent = false,
  toggle_style_key = "<leader>od",
  toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer" },
  code_style = {
    comments = "italic",
    keywords = "bold",
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },
})
require("onedark").load()
-- }}}

-- {{{ Lualine (Status bar) Settings
require("lualine").setup({
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = { { 'filename', file_status = true, path = 2 } }, --> 0 (default) file name, 1 relative path, 2 abs path
    lualine_x = {
      { 'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      },
      'encoding',
      'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { 'filename', file_status = true, path = 1 } },
    lualine_x = {
      { 'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      },
    },
    lualine_y = {},
  },
})
-- }}}

-- {{{ Barbar (Tab bar) Settings
vim.api.nvim_set_keymap('n', "<C-,>", ":BufferPrevious<CR>", { noremap = true, silent = true })
vim.g.bufferline = { icons = true, maximum_padding = 1,
  maximum_length = 30,
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',
  no_name_title = "New Tab"
}
-- Compitability w/ nvim-tree --
require("nvim-tree.events").on_tree_open(function()
  require("bufferline.state").set_offset(31, "File Tree")
end)
require("nvim-tree.events").on_tree_close(function()
  require("bufferline.state").set_offset(0)
end)
-- }}}

-- {{{ Dashboard Settings
local db = require("dashboard")
db.custom_header = {
  "",
  "",
  "",
  "            __..--''``---....___   _..._    __               ",
  "  /// //_.-'    .-/';  `        ``<._  ``.''_ `. / // /      ",
  " ///_.-' _..--.'_    ;                    `( ) ) // //       ",
  " / (_..-' // (< _     ;_..__               ; `' / ///        ",
  "  / // // //  `-._,_)' // / ``--...____..-' /// / //         ",
  "",
  "",
  ",--------.,--.                            ,--.               ",
  "'--.  .--'|  ,---.  ,---.  ,---.,--.  ,--.`--',--,--,--.     ",
  "   |  |   |  .-.  || .-. :| .-. |\\  `'  / ,--.|        |     ",
  "   |  |   |  | |  |\\   --.' '-' ' \\    /  |  ||  |  |  |     ",
  "   `--'   `--' `--' `----' `---'   `--'   `--'`--`--`--'     ",
  "",
  "",
  "",
}
db.custom_center = {
  {
    icon = "  ",
    desc = "Find File           ",
    action = "Telescope find_files",
    shortcut = "SPC ff",
  },
  {
    icon = "  ",
    desc = "Browse Files        ",
    action = "Telescope file_browser",
    shortcut = "SPC fb",
  },
  {
    icon = "  ",
    desc = "New File             ",
    action = "DashboardNewFile",
    shortcut = "SPC t",
  },
  {
    icon = "  ",
    desc = "Configure Dotfiles        ",
    action = "edit ~/dotfiles/",
  },
  {
    icon = "  ",
    desc = "Exit Neovim               ",
    action = "quit",
  },
}
-- }}}

-- {{{ Notification Settings
require("notify").setup()
vim.notify = require("notify")
-- }