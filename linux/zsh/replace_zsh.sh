#!/bin/bash

# Check if the script is run with sudo (root user)
if [ "$(id -u)" -ne 0 ]; then
	echo "This script must be run with sudo."
	exit 1
fi

# Define the source directory and target directory
SOURCE_DIR="."     # Change this to the directory where your files are currently located
TARGET_DIR="$HOME" # Home directory

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
	echo "Source directory does not exist: $SOURCE_DIR"
	exit 1
fi

# Move or rename files to the target directory
echo "Moving files to $TARGET_DIR..."

# Move .zsh, .zsh_aliases, and .zsh_startup to home directory
mv "$SOURCE_DIR/.zshrc" "$TARGET_DIR/.zshrc" 2>/dev/null
cp "$SOURCE_DIR/.zsh_aliases" "$TARGET_DIR/.zsh_aliases" 2>/dev/null
cp "$SOURCE_DIR/.zsh_startup" "$TARGET_DIR/.zsh_startup" 2>/dev/null

# Check if files have been moved
if [ -f "$TARGET_DIR/.zshrc" ]; then
	echo ".zshrc moved successfully."
else
	echo ".zshrc not found or could not be moved."
fi

if [ -f "$TARGET_DIR/.zsh_aliases" ]; then
	echo ".zsh_aliases moved successfully."
else
	echo ".zsh_aliases not found or could not be moved."
fi

if [ -f "$TARGET_DIR/.zsh_startup" ]; then
	echo ".zsh_startup moved successfully."
else
	echo ".zsh_startup not found or could not be moved."
fi
