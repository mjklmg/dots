#!/bin/bash

DOTFILES="$HOME/dots"
CONFIG="$HOME/.config"

find "$DOTFILES" -mindepth 1 -type d  -print0 | 
	while IFS= read -r -d '' dir; do 
		relative="${dir#"$DOTFILES"/}"
		echo "$relative"
		mkdir -p "$CONFIG/$relative";
done

find "$DOTFILES" -type f ! -name "install.sh" -print0 | 
	while IFS= read -r -d '' file; do 
		relative_file="${file#"$DOTFILES"}"
		echo "$relative_file"
		ln -s "$file" "$CONFIG/$relative_file"
done
