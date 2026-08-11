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

# Resolve SKILL.md — local copy first, otherwise download (supports curl | bash)
if [ -n "${SRC_DIR:-}" ] && [ -f "$SRC_DIR/SKILL.md" ]; then
  SKILL="$SRC_DIR/SKILL.md"
  CLEANUP=""
else
  SKILL="$(mktemp)"
  CLEANUP="$SKILL"
  echo "Downloading SKILL.md..."
  curl -fsSL "$RAW/SKILL.md" -o "$SKILL"
fi
trap '[ -n "$CLEANUP" ] && rm -f "$CLEANUP" || true' EXIT

ALL=0
[ "${1:-}" = "--all" ] && ALL=1

have() { command -v "$1" >/dev/null 2>&1; }
want() { # $1=dir $2=binary
  [ "$ALL" = 1 ] && return 0
  [ -d "$1" ] || have "$2"
}

install_skill() { # $1 = skills root
  mkdir -p "$1/human-comms"
  cp "$SKILL" "$1/human-comms/SKILL.md"
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
