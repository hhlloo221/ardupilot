#!/bin/bash
# Convert Cygwin paths to Windows native paths in compile_commands.json
for f in build/*/compile_commands.json; do
    [ -f "$f" ] && sed -i 's|/cygdrive/\([a-z]\)/|\U\1:/|g' "$f"
done
echo "Done: compile_commands.json paths fixed."
