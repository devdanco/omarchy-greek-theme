-- Greek theme — Hyprland border colors
-- Active border: Hellenic blue → Crystal Aegean water gradient
-- Inspired by the gradient of the Aegean sea

local active_border_color = "rgba(1d6fa4ff) rgba(4db8c0ff) 45deg"
local inactive_border_color = "rgba(142438aa)"   -- Muted deep sea

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },
})
