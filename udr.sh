#!/bin/bash

file_path="$3"

if [ -f "$file_path" ]; then
    dir_name=$(dirname "$file_path")
    file_name=$(basename "$file_path")
    
    decoded_name=$(echo "$file_name" | perl -pe 's/\+/ /g; s/%([0-9a-f]{2})/chr(hex($1))/gie')
    
    if [ "$file_name" != "$decoded_name" ]; then
        mv -n "$file_path" "$dir_name/$decoded_name"
        echo "rename: $file_name -> $decoded_name"
    fi
fi