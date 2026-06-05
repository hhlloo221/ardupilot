#!/bin/bash
# Wrapper script for waf upload in Cygwin
# Fixes path resolution issue where waf looks for uploader.py in wrong location

# Copy uploader.py to build directory if it doesn't exist or is outdated
for build_dir in build/*/; do
    if [ -d "${build_dir}bin" ]; then
        mkdir -p "${build_dir}Tools/scripts"
        cp -u Tools/scripts/uploader.py "${build_dir}Tools/scripts/uploader.py" 2>/dev/null
    fi
done

# Run waf with all passed arguments
./waf "$@"
