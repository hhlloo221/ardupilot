# Ardupilot ARM toolchain setup

# Auto-detect Cygwin vs MSYS2
if [ -d /cygdrive/f ]; then
    # Cygwin
    TOOLCHAIN="/cygdrive/f/GCC/10 2020-q4-major/bin"
else
    # MSYS2
    TOOLCHAIN="/f/GCC/10 2020-q4-major/bin"
fi

export PATH="$TOOLCHAIN:$PATH"
echo "ARM GCC: $(which arm-none-eabi-gcc)"
