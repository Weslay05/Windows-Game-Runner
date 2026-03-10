# Windows Game Executor v1.1
# WinePrefix is in Specified path as filename of script
# GAME is for when the first best executable isn't right
#! /run/current-system/sw/bin/bash

GAME_EXE=""
PREFIX_DIR="/media/SanDisk-btrfs/Volume/Games/wine-prefix"

ScDIR=$( dirname "${BASH_SOURCE[0]}" )

if [ -n "$GAME" ]; then
    GAME_PATH=$( find "$ScDIR" -name "*.exe" | head -n1 )
    echo "GAME not defined, running first best executable"
else
    GAME_PATH=$ScDIR/$GAME_EXE
fi

export WINEPREFIX="$PREFIX_DIR/$( basename "${BASH_SOURCE[0]%.*}" )"

# ---------------
# other Variables
# ---------------

export WINEARCH=win64
export PROTON_VERB=waitforexitandrun

# UMU Settings
export GAMEID=umu-default   # Game ID for extra umu tweaks
export UMU_LOG=1
export DXVK_LOG_LEVEL=error
# export STORE=none

# Anti Cheat (Optional)
#export PROTON_BATTLEYE_RUNTIME="$HOME/.local/share/lutris/runtime/battleye_runtime" # Battleye AntiCheat Support
#export PROTON_EAC_RUNTIME="$HOME/.local/share/lutris/runtime/eac_runtime"           # Easy AntiCheat Support

# Performance/Display
export DXVK_HUD=0               # 1 = show FPS and Vulkan stats (0 = off)
export WINE_FULLSCREEN_FSR=1    # Enable AMD FidelityFX Super Resolution (FSR)
export WINEESYNC=1
export WINEFSYNC=1
export DXVK_ASYNC=1             # Enable asynchronous shader compilation for smoother gameplay

# DirectX/DLL
# export WINEDLLOVERRIDES="d3d11=n,builtin;dxgi=n,builtin" # Use Protons build in Directx
export PROTON_DXVK_D3D8=1           # Force Directx8 games to use DXVK
export VKD3D_CONFIG=async           # Async shader compiling for Direct3D 12 games
export WINE_LARGE_ADDRESS_AWARE=1   # Allow >2GB RAM in 32-bit mode
export WINEDLLOVERRIDES="winemenubuilder.exe=d" # Disable Desktop Menu Links

# Cache
export DXVK_SHADER_CACHE_PATH="$WINEPREFIX/dxvk-cache"
export WINE_MONO_CACHE_DIR="$WINEPREFIX/files/cache/mono"
export WINE_GECKO_CACHE_DIR="$WINEPREFIX/files/cache/gecko"

echo "Starting: ( $GAME_PATH )"
umu-run "$GAME_PATH"
