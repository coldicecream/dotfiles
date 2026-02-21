#!/usr/bin/env bash
set -euo pipefail

echo "=== uv bootstrap starting ==="

# --------------------------------------------------
# 1. Ensure required base tools exist
# --------------------------------------------------
echo "Installing prerequisites..."

sudo apt update -y
sudo apt install -y curl ca-certificates

# --------------------------------------------------
# 2. Install uv (if not already installed)
# --------------------------------------------------
if command -v uv >/dev/null 2>&1; then
    echo "uv already installed:"
    uv --version
else
    echo "Installing uv..."

    curl -LsSf https://astral.sh/uv/install.sh | sh

    echo "uv installed."
fi

# --------------------------------------------------
# 3. Ensure PATH is configured
# --------------------------------------------------
UV_BIN="$HOME/.local/bin"

if ! grep -q "$UV_BIN" "$HOME/.profile" 2>/dev/null; then
    echo "Adding uv to PATH via ~/.profile"

    cat >> "$HOME/.profile" <<'EOF'

# Added by uv bootstrap
export PATH="$HOME/.local/bin:$PATH"
EOF
fi

# Apply path immediately for current session
export PATH="$HOME/.local/bin:$PATH"

# --------------------------------------------------
# 4. Verify installation
# --------------------------------------------------
echo "Verifying uv installation..."

if command -v uv >/dev/null 2>&1; then
    uv --version
    echo "=== uv bootstrap complete ==="
else
    echo "ERROR: uv installation failed"
    exit 1
fi
