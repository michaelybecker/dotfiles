#!/bin/bash

# Exit immediately on error
set -e

# Check for nvim and install if missing
if ! command -v nvim >/dev/null 2>&1; then
    echo "Installing nvim..."
    if command -v brew >/dev/null 2>&1; then
        brew install neovim
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v apt-get >/dev/null 2>&1; then
            sudo apt-get update && sudo apt-get install -y neovim
        elif command -v yum >/dev/null 2>&1; then
            sudo yum install -y neovim
        elif command -v dnf >/dev/null 2>&1; then
            sudo dnf install -y neovim
        elif command -v pacman >/dev/null 2>&1; then
            sudo pacman -S --noconfirm neovim
        else
            echo "Warning: No supported package manager found. Please install neovim manually."
        fi
    fi
else
    echo "nvim is already installed."
fi

# Create vim -> nvim symlink if vim doesn't exist or is not nvim
if ! command -v vim >/dev/null 2>&1 || ! vim --version | grep -q "NVIM"; then
    NVIM_PATH=$(command -v nvim)
    if [ -n "$NVIM_PATH" ]; then
        # Find a suitable directory in PATH to create the symlink
        for dir in $(echo $PATH | tr ':' ' '); do
            if [ -w "$dir" ] && [ "$dir" != "/usr/bin" ] && [ "$dir" != "/bin" ]; then
                if [ -e "$dir/vim" ] && [ ! -L "$dir/vim" ]; then
                    echo "Backing up existing vim at $dir/vim"
                    sudo mv "$dir/vim" "$dir/vim.backup" 2>/dev/null || mv "$dir/vim" "$dir/vim.backup"
                fi
                sudo ln -sf "$NVIM_PATH" "$dir/vim" 2>/dev/null || ln -sf "$NVIM_PATH" "$dir/vim"
                echo "Created vim -> nvim symlink at $dir/vim"
                break
            fi
        done
    fi
fi

# Check for Homebrew and install dependencies
if command -v brew >/dev/null 2>&1; then
    echo "Installing dependencies with Homebrew..."
    brew install imagemagick slides pyenv fzf ripgrep
else
    echo "Warning: Homebrew not found. Installing fzf and ripgrep manually and other dependencies need manual installation."
    
    # Install fzf and ripgrep on Linux
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v apt-get >/dev/null 2>&1; then
            sudo apt-get update && sudo apt-get install -y fzf ripgrep
        elif command -v yum >/dev/null 2>&1; then
            sudo yum install -y fzf ripgrep
        elif command -v dnf >/dev/null 2>&1; then
            sudo dnf install -y fzf ripgrep
        elif command -v pacman >/dev/null 2>&1; then
            sudo pacman -S --noconfirm fzf ripgrep
        else
            echo "Warning: No supported package manager found. Please install fzf and ripgrep manually."
        fi
    fi
    
    echo "Please install ImageMagick, slides, and pyenv manually."
fi

# Get absolute path to directory this script is run from
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Dotfiles to link
FILES=(".zshrc" ".wezterm.lua" "tmux.conf")

for FILE in "${FILES[@]}"; do
    # Special handling for tmux.conf
    if [ "$FILE" = "tmux.conf" ]; then
        TARGET="$HOME/.config/tmux/tmux.conf"
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
