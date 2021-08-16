#!/usr/bin/env bash

# Save dconf custom settings:
# 1. Iterate all the files in the dconf folder
# 2. Replace ':' in filename with '/' to get the dconf path
# 3. Dump dconf config
# 4. Discard data after the first blank line
# 5. Sort the lines so keys preserve order and diffs make sense
# 6. Overwrite file with new dump

for filename in "$HOME"/.dotfiles/dconf/*.dconf; do
	NAME=$(basename "$filename" .dconf | tr : /)
	dconf dump /"$NAME"/ | sed "/^$/q" | sort > "$filename"
done
