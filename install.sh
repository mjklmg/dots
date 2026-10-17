
#!/bin/bash

DOTFILES="$HOME/dots"
CONFIG="$HOME/.config"

# Create directories, excluding .git
find "$DOTFILES" -mindepth 1 \
    -type d -name ".git" -prune -o \
    -type d -print0 |
while IFS= read -r -d '' dir; do
    relative="${dir#"$DOTFILES"/}"
    echo "Creating directory: $relative in $CONFIG"
    mkdir -p "$CONFIG/$relative"
done

# Create symlinks, excluding .git and specified files
find "$DOTFILES" \
    -type d -name ".git" -prune -o \
    -type f \
    ! -name "install.sh" \
    ! -name "Readme.md" \
    -print0 |
while IFS= read -r -d '' file; do
    relative_file="${file#"$DOTFILES"/}"
    destination="$CONFIG/$relative_file"

    # Skip existing files and symlinks
    if [[ -e "$destination" || -L "$destination" ]]; then
        echo "Skipping destination: $destination"
        continue
    fi

    # Ensure the parent directory exists
    mkdir -p "$(dirname "$destination")"

    echo "Symlinking: $relative_file"
    ln -s "$file" "$destination"
done

