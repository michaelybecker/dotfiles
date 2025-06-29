#!/bin/bash

# Exit immediately on error
set -e

# Get absolute path to directory this script is run from
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Dotfiles to link
FILES=(".vimrc" ".bashrc" ".zshrc")

for FILE in "${FILES[@]}"; do
    TARGET="$HOME/$FILE"
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
