#!/usr/bin/env bash
# human-comms installer — installs the skill into every AI agent CLI it finds.
# Usage:
#   ./install.sh          install into detected tools
#   ./install.sh --all    install into ALL supported tools (even if not detected)
# Also works standalone:
#   bash <(curl -fsSL https://raw.githubusercontent.com/jarbasmoraes/human-comms/main/install.sh)
set -euo pipefail

RAW="https://raw.githubusercontent.com/jarbasmoraes/human-comms/main"
SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-}")" 2>/dev/null && pwd || true)"

# Stage the complete skill before changing any installation.
STAGING="$(mktemp -d)"
trap 'rm -rf "$STAGING"' EXIT
if [ -n "${SRC_DIR:-}" ] && [ -f "$SRC_DIR/SKILL.md" ]; then
  cp "$SRC_DIR/SKILL.md" "$STAGING/SKILL.md"
  cp -R "$SRC_DIR/examples" "$STAGING/examples"
else
  echo "Downloading human-comms..."
  curl -fsSL "$RAW/SKILL.md" -o "$STAGING/SKILL.md"
  mkdir -p "$STAGING/examples"
  for example in completion-summary error-report question-blocker status-update-ptbr large-report durable-report evergreen-note referenced-review; do
    curl -fsSL "$RAW/examples/$example.md" -o "$STAGING/examples/$example.md"
  done
fi

ALL=0
[ "${1:-}" = "--all" ] && ALL=1

have() { command -v "$1" >/dev/null 2>&1; }
want() { # $1=dir $2=binary
  [ "$ALL" = 1 ] && return 0
  [ -d "$1" ] || have "$2"
}

install_skill() { # $1 = skills root
  mkdir -p "$1/human-comms"
  cp "$STAGING/SKILL.md" "$1/human-comms/SKILL.md"
  mkdir -p "$1/human-comms/examples"
  cp "$STAGING/examples/"*.md "$1/human-comms/examples/"
}

INSTALLED=()

echo "Installing human-comms..."
echo

# -- Claude Code ----------------------------------------------
if want "$HOME/.claude" claude; then
  install_skill "$HOME/.claude/skills"
  INSTALLED+=("Claude Code  -> ~/.claude/skills/human-comms/SKILL.md")
fi

# -- Pi -------------------------------------------------------
if want "$HOME/.pi" pi; then
  install_skill "$HOME/.pi/agent/skills"
  INSTALLED+=("Pi           -> ~/.pi/agent/skills/human-comms/SKILL.md")
fi

# -- OpenAI Codex ---------------------------------------------
if want "$HOME/.codex" codex; then
  install_skill "$HOME/.codex/skills"
  INSTALLED+=("Codex CLI    -> ~/.codex/skills/human-comms/SKILL.md")
fi

# -- opencode -------------------------------------------------
OC_CFG="${XDG_CONFIG_HOME:-$HOME/.config}/opencode"
if want "$OC_CFG" opencode; then
  install_skill "$OC_CFG/skills"
  INSTALLED+=("opencode     -> $OC_CFG/skills/human-comms/SKILL.md")
fi

# -- Hermes Agent ---------------------------------------------
if want "$HOME/.hermes" hermes; then
  install_skill "$HOME/.hermes/skills"
  INSTALLED+=("Hermes Agent -> ~/.hermes/skills/human-comms/SKILL.md")
fi

echo
if [ "${#INSTALLED[@]}" = 0 ]; then
  echo "No supported tools detected. Run './install.sh --all' to install everywhere anyway."
  exit 1
fi

printf 'Installed: %s\n' "${INSTALLED[@]}"
echo
echo "Done. Restart your agent (or start a new session) to pick up the skill."
