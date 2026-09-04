#!/usr/bin/env bash
# Greek theme — theme-set hook
# Applies Aegean border gradient to Hyprland when the Greek theme is active.
# Install: omarchy hook install theme-set ~/.config/omarchy/themes/greek/hooks/greek-borders.sh

THEME_SLUG="$1"

# Only act when Greek theme is applied
[[ "$THEME_SLUG" == "greek" ]] || exit 0

OVERRIDE="$HOME/.config/hypr/looknfeel.lua"

# Write the Greek border gradient into looknfeel.lua
# (backs up any previous content on first run)
if ! grep -q "greek-theme-borders" "$OVERRIDE" 2>/dev/null; then
  cp "$OVERRIDE" "${OVERRIDE}.bak.$(date +%s)" 2>/dev/null || true
fi

# Inject or replace the border block (idempotent)
if grep -q "greek-theme-borders" "$OVERRIDE" 2>/dev/null; then
  # Already present — nothing to do, colors.toml drives it via hyprland.lua template
  :
else
  cat >> "$OVERRIDE" <<'LUA'

-- greek-theme-borders: Aegean gradient (managed by greek theme hook)
hl.config({
  general = {
    col = {
      active_border   = { colors = { "rgba(1d6fa4ff)", "rgba(4db8c0ff)" }, angle = 45 },
      inactive_border = "rgba(142438aa)",
    },
  },
  group = {
    col = {
      border_active   = { colors = { "rgba(1d6fa4ff)", "rgba(4db8c0ff)" }, angle = 45 },
      border_inactive = "rgba(142438aa)",
    },
  },
})
LUA
fi

hyprctl reload >/dev/null 2>&1 || true
