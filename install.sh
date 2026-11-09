#!/usr/bin/env bash
# human-comms installer — installs both skills (human-comms and cold-read) into every AI agent
# CLI it finds.
# Usage:
#   ./install.sh          install into detected tools
#   ./install.sh --all    install into ALL supported tools (even if not detected)
# Also works standalone:
#   bash <(curl -fsSL https://raw.githubusercontent.com/jarbasmoraes/human-comms/main/install.sh)
set -euo pipefail

RAW="https://raw.githubusercontent.com/jarbasmoraes/human-comms/main"
SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-}")" 2>/dev/null && pwd || true)"
SKILLS=(human-comms cold-read)
# The examples each skill ships, for the standalone download.
EXAMPLES_human_comms="completion-summary error-report question-blocker status-update-ptbr large-report durable-report evergreen-note referenced-review"
EXAMPLES_cold_read="cold-read-answer"

# Stage every skill completely before changing any installation.
STAGING="$(mktemp -d)"
trap 'rm -rf "$STAGING"' EXIT
if [ -n "${SRC_DIR:-}" ] && [ -f "$SRC_DIR/skills/human-comms/SKILL.md" ]; then
  for skill in "${SKILLS[@]}"; do
    cp -R "$SRC_DIR/skills/$skill" "$STAGING/$skill"
  done
else
  echo "Downloading human-comms and cold-read..."
  for skill in "${SKILLS[@]}"; do
    mkdir -p "$STAGING/$skill/examples"
    curl -fsSL "$RAW/skills/$skill/SKILL.md" -o "$STAGING/$skill/SKILL.md"
    examples_var="EXAMPLES_${skill//-/_}"
    for example in ${!examples_var}; do
      curl -fsSL "$RAW/skills/$skill/examples/$example.md" -o "$STAGING/$skill/examples/$example.md"
    done
  done
fi

ALL=0
[ "${1:-}" = "--all" ] && ALL=1

have() { command -v "$1" >/dev/null 2>&1; }
want() { # $1=dir $2=binary
  [ "$ALL" = 1 ] && return 0
  [ -d "$1" ] || have "$2"
}

install_skills() { # $1 = skills root
  for skill in "${SKILLS[@]}"; do
    mkdir -p "$1/$skill/examples"
    cp "$STAGING/$skill/SKILL.md" "$1/$skill/SKILL.md"
    cp "$STAGING/$skill/examples/"*.md "$1/$skill/examples/"
  done
}

INSTALLED=()

echo "Installing human-comms and cold-read..."
echo

# -- Claude Code ----------------------------------------------
if want "$HOME/.claude" claude; then
  install_skills "$HOME/.claude/skills"
  INSTALLED+=("Claude Code  -> ~/.claude/skills/{human-comms,cold-read}")
fi

# -- Pi -------------------------------------------------------
if want "$HOME/.pi" pi; then
  install_skills "$HOME/.pi/agent/skills"
  INSTALLED+=("Pi           -> ~/.pi/agent/skills/{human-comms,cold-read}")
fi

# -- OpenAI Codex ---------------------------------------------
if want "$HOME/.codex" codex; then
  install_skills "$HOME/.codex/skills"
  INSTALLED+=("Codex CLI    -> ~/.codex/skills/{human-comms,cold-read}")
fi

# -- opencode -------------------------------------------------
OC_CFG="${XDG_CONFIG_HOME:-$HOME/.config}/opencode"
if want "$OC_CFG" opencode; then
  install_skills "$OC_CFG/skills"
  INSTALLED+=("opencode     -> $OC_CFG/skills/{human-comms,cold-read}")
fi

# -- Hermes Agent ---------------------------------------------
if want "$HOME/.hermes" hermes; then
  install_skills "$HOME/.hermes/skills"
  INSTALLED+=("Hermes Agent -> ~/.hermes/skills/{human-comms,cold-read}")
fi

echo
if [ "${#INSTALLED[@]}" = 0 ]; then
  echo "No supported tools detected. Run './install.sh --all' to install everywhere anyway."
  exit 1
fi

printf 'Installed: %s\n' "${INSTALLED[@]}"
echo
echo "Done. Restart your agent (or start a new session) to pick up the skills."
