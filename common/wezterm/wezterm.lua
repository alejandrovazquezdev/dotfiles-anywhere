-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- Window appearance
config.initial_cols = 120
config.initial_rows = 28
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20

-- Font configuration
config.font_size = 12

-- Color scheme
config.color_scheme = 'Catppuccin Mocha'

-- Window decorations (keeps title bar with buttons)
config.window_decorations = 'TITLE | RESIZE'
config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
}

-- Tab bar
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

-- Finally, return the configuration to wezterm:
return config
