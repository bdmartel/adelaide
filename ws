#!/bin/zsh
# ws — Adelaide workspace controller
# Manages cmux workspace theming, progress bar, and status
#
# Usage:
#   ws theme          Apply Adelaide brown theme to workspace tab
#   ws progress <pct> Set progress bar (0-100), e.g.: ws progress 45
#   ws progress <pct> <label>  Set progress with custom label
#   ws label <text>   Update progress label without changing value
#   ws status <text>  Set status pill text (keeps Adelaide brown)
#   ws icon <name>    Change status icon (SF Symbol name)
#   ws clear          Clear progress bar
#   ws reset          Reset everything to Adelaide defaults
#   ws show           Show current workspace state

# ── Adelaide brand palette ──
ADELAIDE_BROWN="#9b632b"    # warm amber-brown (primary accent)
ADELAIDE_DARK="#35190d"     # deep espresso (text/dark)
ADELAIDE_BG="#e6e2de"       # warm beige (background)

# ── State file for tracking progress value ──
STATE_FILE="${0:a:h}/.ws-state"

_read_progress() {
  if [[ -f "$STATE_FILE" ]]; then
    source "$STATE_FILE"
  else
    WS_PROGRESS=0
    WS_LABEL="Adelaide v2"
  fi
}

_write_progress() {
  cat > "$STATE_FILE" <<EOF
WS_PROGRESS=$WS_PROGRESS
WS_LABEL="$WS_LABEL"
EOF
}

case "${1:-show}" in
  theme)
    cmux set-status claude_code "Running" --icon bolt.fill --color "$ADELAIDE_BROWN"
    echo "Theme applied: Adelaide brown ($ADELAIDE_BROWN)"
    ;;

  progress|p)
    _read_progress
    if [[ -z "$2" ]]; then
      echo "Progress: ${WS_PROGRESS}% — $WS_LABEL"
      exit 0
    fi
    WS_PROGRESS="$2"
    [[ -n "$3" ]] && WS_LABEL="${*:3}"
    _write_progress
    # cmux wants 0.0-1.0
    local frac
    frac=$(echo "scale=2; $WS_PROGRESS / 100" | bc)
    cmux set-progress "$frac" --label "$WS_LABEL ($WS_PROGRESS%)"
    echo "Progress: ${WS_PROGRESS}% — $WS_LABEL"
    ;;

  label|l)
    _read_progress
    WS_LABEL="${*:2}"
    _write_progress
    local frac
    frac=$(echo "scale=2; $WS_PROGRESS / 100" | bc)
    cmux set-progress "$frac" --label "$WS_LABEL ($WS_PROGRESS%)"
    echo "Label updated: $WS_LABEL"
    ;;

  status|s)
    cmux set-status claude_code "${*:2}" --icon bolt.fill --color "$ADELAIDE_BROWN"
    echo "Status: ${*:2}"
    ;;

  icon|i)
    cmux set-status claude_code "Running" --icon "$2" --color "$ADELAIDE_BROWN"
    echo "Icon: $2"
    ;;

  clear|c)
    cmux clear-progress
    rm -f "$STATE_FILE"
    echo "Progress cleared"
    ;;

  reset|r)
    cmux set-status claude_code "Running" --icon bolt.fill --color "$ADELAIDE_BROWN"
    cmux set-progress 0.0 --label "Adelaide v2"
    WS_PROGRESS=0
    WS_LABEL="Adelaide v2"
    _write_progress
    echo "Workspace reset to Adelaide defaults"
    ;;

  show)
    _read_progress
    echo "═══════════════════════════════════"
    echo "  ADELAIDE WORKSPACE"
    echo "  Brown: $ADELAIDE_BROWN"
    echo "  Progress: ${WS_PROGRESS}% — $WS_LABEL"
    echo "═══════════════════════════════════"
    cmux list-status
    ;;

  *)
    echo "Usage: ws {theme|progress|label|status|icon|clear|reset|show} [args]"
    echo ""
    echo "  ws theme              Apply Adelaide brown to tab"
    echo "  ws progress 45        Set progress to 45%"
    echo "  ws progress 60 QA     Set progress to 60% with label 'QA'"
    echo "  ws label 'Food menu'  Update label text"
    echo "  ws status Building    Set status pill text"
    echo "  ws icon hammer        Change icon (SF Symbol)"
    echo "  ws clear              Remove progress bar"
    echo "  ws reset              Reset to defaults"
    echo "  ws show               Current state"
    ;;
esac
