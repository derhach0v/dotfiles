-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Tokyo Night Moon"
config.show_tabs_in_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.font = wezterm.font_with_fallback({ "JetBrainsMono Nerd Font Mono" })

config.font_size = 16.0
config.line_height = 1.2
config.window_background_opacity = 0.9
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "home"

-- and finally, return the configuration to wezterm
return config
