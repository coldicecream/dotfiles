#!/usr/bin/env bash
set -euo pipefail

# --------------------------------------------------
# Helpers
# --------------------------------------------------
log() {
    echo
    echo "========== $1 =========="
}

# --------------------------------------------------
# Locate dotfiles directory (works from anywhere)
# --------------------------------------------------
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR="$DOTFILES_DIR/scripts"

# --------------------------------------------------
# Sanity checks
# --------------------------------------------------
if [[ ! -d "$SCRIPTS_DIR" ]]; then
    echo "ERROR: scripts directory not found"
    exit 1
fi

# --------------------------------------------------
# Make scripts executable (safe to rerun)
# --------------------------------------------------
chmod +x "$SCRIPTS_DIR"/*.sh

# --------------------------------------------------
# Bootstrap Steps
# --------------------------------------------------

log "Starting bootstrap"

# ---- uv installation ----
log "Installing uv"
"$SCRIPTS_DIR/bootstrap_uv.sh"

# ---- uv installation ----
log "Installing codex"
"$SCRIPTS_DIR/bootstrap_codex.sh"

# --------------------------------------------------
# Completion
# --------------------------------------------------
log "Bootstrap complete"

echo "Recommended next step:"
echo "  restart your shell or run: exec \$SHELL"
