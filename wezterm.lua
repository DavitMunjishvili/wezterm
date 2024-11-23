local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "GruvboxDark"

-- config.window_background_image = "/Users/dmunjishvili/.config/wezterm/powered-by.png"

config.font = wezterm.font({
	family = "JetBrainsMono Nerd Font",
	weight = "Regular",
	harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
})
config.font_size = 24

config.native_macos_fullscreen_mode = true
config.show_close_tab_button_in_tabs = false
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

-- config.colors = {
-- 	tab_bar = {
-- 		inactive_tab_edge = "transparent",
-- 	},
-- }

-- local function tab_title(tab_info)
-- 	local title = tab_info.tab_title
--
-- 	if title and #title > 0 then
-- 		return title
-- 	end
--
-- 	return tab_info.active_pane.title
-- end
--
-- wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
-- 	local edge_background = "transparent"
-- 	local background = "#282828"
-- 	local foreground = "#fabd2f"
--
-- 	if tab.is_active then
-- 		background = "#fabd2f"
-- 		foreground = "#282828"
-- 	elseif hover then
-- 		background = "#504945"
-- 	end
--
-- 	local edge_foreground = background
--
-- 	local title = tab_title(tab)
--
-- 	title = wezterm.truncate_right(title, max_width - 2)
--
-- 	return {
-- 		{ Background = { Color = edge_background } },
-- 		{ Foreground = { Color = edge_foreground } },
-- 		{ Text = SOLID_LEFT_ARROW },
-- 		{ Background = { Color = background } },
-- 		{ Foreground = { Color = foreground } },
-- 		{ Text = title },
-- 		{ Background = { Color = edge_background } },
-- 		{ Foreground = { Color = edge_foreground } },
-- 		{ Text = SOLID_RIGHT_ARROW },
-- 	}
-- end)

-- wezterm.on("gui-startup", function(cmd)
-- 	local _, _, window = mux.spawn_window(cmd or { workspace = "account management" })
-- 	local _, account_management_nvim, _ = window:spawn_tab({ cwd = "~" })
-- 	account_management_nvim:send_text("cd Codes/account-management/\n")
-- 	window:gui_window():toggle_fullscreen()
-- end)

config.disable_default_key_bindings = true
config.keys = {
	{ key = "Enter", mods = "CMD", action = wezterm.action.ToggleFullScreen },
	{ key = "+", mods = "CMD", action = wezterm.action.IncreaseFontSize },
	{ key = "-", mods = "CMD", action = wezterm.action.DecreaseFontSize },
	{ key = "0", mods = "CMD", action = wezterm.action.ResetFontSize },
	{ key = "d", mods = "CMD", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "t", mods = "CMD", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
	{ key = "Tab", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "c", mods = "CMD|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "v", mods = "CMD|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "f", mods = "CMD", action = wezterm.action.Search({ CaseSensitiveString = "" }) },
	{ key = "p", mods = "CMD|SHIFT", action = wezterm.action.ActivateCommandPalette },
	{ key = "h", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "j", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Up") },
	{
		key = "w",
		mods = "CMD|SHIFT",
		action = wezterm.action.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
}

config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CMD",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
