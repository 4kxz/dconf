#!/usr/bin/env bash

# Apply dconf serialized settings, doing the reverse process
for filename in "$HOME"/.dotfiles/dconf/*.dconf; do
        NAME=$(basename "$filename" .dconf | tr : /)
        dconf load /"$NAME"/ < $filename
done
