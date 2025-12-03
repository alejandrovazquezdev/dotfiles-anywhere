-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- Window appearance
config.initial_cols = 130
config.initial_rows = 35
config.window_background_opacity = 0.92
config.macos_window_background_blur = 30

-- Font configuration
config.font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Medium' })
config.font_size = 13
config.line_height = 1.2


-- Color scheme
config.color_scheme = 'Catppuccin Mocha'

-- Enhance colors
config.bold_brightens_ansi_colors = true

-- Window decorations (keeps title bar with buttons)
config.window_decorations = 'TITLE | RESIZE'
config.window_padding = {
  left = 16,
  right = 16,
  top = 16,
  bottom = 16,
}

-- Tab bar
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.tab_max_width = 32

-- Cursor
config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_rate = 700
config.cursor_thickness = 2

-- Scrollback
config.scrollback_lines = 10000

-- Performance
config.animation_fps = 60
config.max_fps = 120

-- Finally, return the configuration to wezterm:
return config
