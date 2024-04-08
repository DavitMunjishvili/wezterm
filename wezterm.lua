local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {}

config.color_scheme = "Tokyo Night Moon"
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
config.font_size = 16
-- config.window_background_image = wezterm.home_dir .. "/.config/wezterm/catto.jpg"
config.window_background_opacity = 0.9

config.enable_tab_bar = false
config.native_macos_fullscreen_mode = true
config.max_fps = 120
config.disable_default_key_bindings = true

wezterm.on("gui-startup", function()
	local _, pane, window = mux.spawn_window({})
	local gui_window = window:gui_window()
	gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
end)

config.keys = {
	{
		key = "Enter",
		mods = "CMD",
		action = wezterm.action.ToggleFullScreen,
	},
	{ key = "+", mods = "CMD", action = wezterm.action.IncreaseFontSize },
	{ key = "-", mods = "CMD", action = wezterm.action.DecreaseFontSize },
	{ key = "0", mods = "CMD", action = wezterm.action.ResetFontSize },
	{ key = "d", mods = "CMD", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "t", mods = "CMD", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
	{ key = "Tab", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "c", mods = "CMD|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "v", mods = "CMD|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
