#!/bin/bash

# Exit immediately on error
set -e

# Check for Homebrew and install dependencies
if command -v brew >/dev/null 2>&1; then
    echo "Installing dependencies with Homebrew..."
    brew install imagemagick slides pyenv
else
    echo "Warning: Homebrew not found. Please install ImageMagick, slides, and pyenv manually."
fi

# Get absolute path to directory this script is run from
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Dotfiles to link
FILES=(".vimrc" ".bashrc" ".zshrc" ".wezterm.lua" "tmux.conf")

for FILE in "${FILES[@]}"; do
    # Special handling for tmux.conf
    if [ "$FILE" = "tmux.conf" ]; then
        TARGET="$HOME/.tmux.conf"
    else
        TARGET="$HOME/$FILE"
    fi
    SOURCE="$SCRIPT_DIR/$FILE"

    # Warn if source file doesn't exist
    if [ ! -e "$SOURCE" ]; then
        echo "Warning: $SOURCE does not exist. Skipping."
        continue
    fi

    # Backup if target exists and is not a symlink
    if [ -e "$TARGET" ] && [ ! -L "$TARGET" ]; then
        echo "Backing up existing $TARGET to $TARGET.backup"
        mv "$TARGET" "$TARGET.backup"
    fi

    # Remove existing file or symlink
    if [ -L "$TARGET" ] || [ -e "$TARGET" ]; then
        rm -f "$TARGET"
    fi

    # Create new symlink
    ln -s "$SOURCE" "$TARGET"
    echo "Linked $TARGET -> $SOURCE"
done

# Handle .config directory
CONFIG_TARGET="$HOME/.config"
CONFIG_SOURCE="$SCRIPT_DIR/.config"

if [ -d "$CONFIG_SOURCE" ]; then
    # Create .config directory if it doesn't exist
    mkdir -p "$CONFIG_TARGET"
    
    # Link nvim config
    NVIM_TARGET="$CONFIG_TARGET/nvim"
    NVIM_SOURCE="$CONFIG_SOURCE/nvim"
    
    if [ -d "$NVIM_SOURCE" ]; then
        # Backup existing nvim config if it exists and is not a symlink
        if [ -e "$NVIM_TARGET" ] && [ ! -L "$NVIM_TARGET" ]; then
            echo "Backing up existing $NVIM_TARGET to $NVIM_TARGET.backup"
            mv "$NVIM_TARGET" "$NVIM_TARGET.backup"
        fi
        
        # Remove existing file or symlink
        if [ -L "$NVIM_TARGET" ] || [ -e "$NVIM_TARGET" ]; then
            rm -rf "$NVIM_TARGET"
        fi
        
        # Create new symlink
        ln -s "$NVIM_SOURCE" "$NVIM_TARGET"
        echo "Linked $NVIM_TARGET -> $NVIM_SOURCE"
    fi
fi
