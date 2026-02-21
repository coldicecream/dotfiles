#!/usr/bin/env bash
set -euo pipefail

echo "=== Codex CLI bootstrap starting ==="

# ---------
# 1) Prereqs
# ---------
echo "Installing prerequisites (nodejs + npm)..."
sudo apt update -y
sudo apt install -y ca-certificates curl nodejs npm

# ---------
# 2) Configure npm global prefix (no sudo installs)
# ---------
NPM_PREFIX="${HOME}/.local/npm"
NPM_BIN="${NPM_PREFIX}/bin"

mkdir -p "${NPM_PREFIX}"

# Set npm prefix if not already set to our desired value
CURRENT_PREFIX="$(npm config get prefix || true)"
if [[ "${CURRENT_PREFIX}" != "${NPM_PREFIX}" ]]; then
  echo "Configuring npm global prefix: ${NPM_PREFIX}"
  npm config set prefix "${NPM_PREFIX}"
fi

# Ensure PATH includes the npm global bin directory (persistent)
PROFILE_FILE="${HOME}/.profile"
if ! grep -qs "${NPM_BIN}" "${PROFILE_FILE}"; then
  cat >> "${PROFILE_FILE}" <<EOF

# Added by codex bootstrap (npm global bin)
export PATH="${NPM_BIN}:\$PATH"
EOF
fi

# Apply PATH for current session
export PATH="${NPM_BIN}:${PATH}"

# ---------
# 3) Install / update Codex CLI
# ---------
if command -v codex >/dev/null 2>&1; then
  echo "Codex already installed; updating to latest..."
else
  echo "Installing Codex CLI..."
fi

npm install -g @openai/codex@latest

# ---------
# 4) Verify
# ---------
echo "Verifying installation..."
if command -v codex >/dev/null 2>&1; then
  codex --version || true
  echo "=== Codex CLI bootstrap complete ==="
  echo "If 'codex' is not found in a new terminal, run: source ~/.profile"
else
  echo "ERROR: 'codex' not found after installation."
  echo "Try: source ~/.profile && which codex && codex --version"
  exit 1
fi
