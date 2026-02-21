#!/usr/bin/env bash
set -euo pipefail

echo "=== Oh My Zsh bootstrap starting ==="

# --------------------------------------------------
# 1. Ensure zsh exists
# --------------------------------------------------
if ! command -v zsh >/dev/null 2>&1; then
    echo "Installing zsh..."
    sudo apt update -y
    sudo apt install -y zsh git curl
fi

# --------------------------------------------------
# 2. Install Oh My Zsh (if not installed)
# --------------------------------------------------
OMZ_DIR="$HOME/.oh-my-zsh"

if [[ -d "$OMZ_DIR" ]]; then
    echo "Oh My Zsh already installed."
else
    echo "Installing Oh My Zsh..."

    RUNZSH=no \
    CHSH=no \
    KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo "Oh My Zsh installed."
fi

# --------------------------------------------------
# 3. Set zsh as default shell (WSL-safe)
# --------------------------------------------------
CURRENT_SHELL="$(getent passwd "$USER" | cut -d: -f7)"

if [[ "$CURRENT_SHELL" != "/usr/bin/zsh" ]]; then
    echo "Setting zsh as default shell..."
    chsh -s /usr/bin/zsh "$USER"
else
    echo "zsh already default shell."
fi

# --------------------------------------------------
# 4. Verify installation
# --------------------------------------------------
if [[ -d "$OMZ_DIR" ]]; then
    echo "Oh My Zsh directory verified."
else
    echo "ERROR: Oh My Zsh installation failed."
    exit 1
fi

echo "=== Oh My Zsh bootstrap complete ==="
echo "Restart shell or run: exec zsh"
