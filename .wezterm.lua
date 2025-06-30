local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Dracula+ theme colors
config.colors = {
  foreground = '#f8f8f2',
  background = '#22212c',
  cursor_bg = '#f8f8f2',
  cursor_fg = '#22212c',
  cursor_border = '#f8f8f2',
  selection_fg = '#f8f8f2',
  selection_bg = '#454158',
  scrollbar_thumb = '#454158',
  split = '#6272a4',

  ansi = {
    '#22212c', -- black
    '#ff9580', -- red
    '#8aff80', -- green  
    '#ffff80', -- yellow
    '#9580ff', -- blue
    '#ff80bf', -- magenta
    '#80ffea', -- cyan
    '#f8f8f2', -- white
  },

  brights = {
    '#454158', -- bright black
    '#ffaa99', -- bright red
    '#a2ff99', -- bright green
    '#ffff99', -- bright yellow
    '#aa99ff', -- bright blue
    '#ff99cc', -- bright magenta
    '#99ffee', -- bright cyan
    '#ffffff', -- bright white
  },
}

-- Font configuration
config.font = wezterm.font('JetBrains Mono', { weight = 'Regular' })
config.font_size = 14.0

-- Window configuration
config.window_background_opacity = 0.95
config.window_decorations = 'RESIZE'
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- Cursor configuration
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 800

-- Scrollback
config.scrollback_lines = 10000

-- Key bindings
config.keys = {
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
}

return config