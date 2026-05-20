#!/usr/bin/env bash
#
# setup-zed.sh
# Safely configures Zed IDE settings using symbolic links (symlinks).
#
set -euo pipefail

# 1. Determine directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
ZED_DIR="$HOME/.config/zed"

echo "========================================="
echo "⚙️  Setting up Zed IDE Configuration..."
echo "========================================="
echo "📂 Repository: $REPO_DIR"
echo "📂 Target:     $ZED_DIR"
echo "========================================="

# 2. Create target directory if not exists
if [ ! -d "$ZED_DIR" ]; then
  echo "📁 Creating Zed configuration directory: $ZED_DIR"
  mkdir -p "$ZED_DIR"
fi

# 3. Helper function to safely symlink a file or directory
symlink_item() {
  local src="$1"
  local dest="$2"

  if [ ! -e "$src" ]; then
    echo "❌ Error: Source file/folder does not exist: $src" >&2
    return 1
  fi

  # If target exists (or is a broken/valid symlink)
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    # If it is already a symlink pointing to the correct source, skip
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
      echo "✅ $(basename "$dest") is already linked correctly."
      return 0
    fi

    # Back up existing file or directory
    local timestamp
    timestamp=$(date +%Y%m%d_%H%M%S)
    local backup="${dest}.bak.${timestamp}"
    echo "⚠️  Found existing $(basename "$dest"). Backing up to $(basename "$backup")..."
    mv "$dest" "$backup"
  fi

  # Create symlink
  echo "🔗 Linking $(basename "$dest") -> $src"
  ln -s "$src" "$dest"
}

# 4. Link individual files
symlink_item "$REPO_DIR/zed/settings.json" "$ZED_DIR/settings.json"
symlink_item "$REPO_DIR/zed/keymap.json" "$ZED_DIR/keymap.json"
symlink_item "$REPO_DIR/zed/tasks.json" "$ZED_DIR/tasks.json"

# 5. Link themes directory
symlink_item "$REPO_DIR/zed/themes" "$ZED_DIR/themes"

echo "========================================="
echo "🎉 Zed IDE Configuration configured successfully!"
echo "💡 Any modifications inside Zed will now be saved in this repository."
echo "========================================="
