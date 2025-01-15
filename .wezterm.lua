local wezterm = require 'wezterm'

local config = wezterm.config_builder()

local act = wezterm.action

config.window_background_opacity = 0.5
config.hide_tab_bar_if_only_one_tab = true

config.window_frame = {
  font = wezterm.font("FiraMono Nerd Font"),
  font_size = 12.0,

  active_titlebar_bg = '#202020',
  inactive_titlebar_bg = '#202020',
}

config.colors = {
  tab_bar = {
    inactive_tab_edge = 'rgb(197, 197, 197)',

    active_tab = {
      bg_color = "rgb(170, 170, 255)",
      fg_color = "#202020",
    },

    inactive_tab = {
      bg_color = "#202020",
      fg_color = "rgb(197, 197, 197)",
    },

    inactive_tab_hover = {
      bg_color = "#504945",
      fg_color = "#ffffff",
    },

    new_tab = {
      bg_color = "#202020",
      fg_color = "rgb(197, 197, 197)",
    },

    new_tab_hover = {
      bg_color = "#504945",
      fg_color = "#ffffff",
    }
  },

  cursor_bg = 'rgb(170, 170, 255)',
  cursor_border = 'rgb(170, 170, 255)',
  cursor_fg = 'black',
}

return config
