#! /run/current-system/sw/bin/bash

# Windows Game Executor v2.2.1
# WinePrefix is in Specified path as filename of script
# The executable run is the Filename without .sh

ScDIR=$( dirname "${BASH_SOURCE[0]}" )
ScNAME=$( basename "${BASH_SOURCE[0]%.sh}" )

#! Important

export PROTON_NAME="GE-Proton10-32"
export WINE_NAME="wine-11.4-amd64" # Optional and not used when only umu-run
export DXVK_NAME="dxvk-gplasync-v2.7.1-1"
export VKD3D_NAME="vkd3d-proton-3.0"

# Async Shader Compilation ( Only use in Singleplayer Games ) 
# Only Activates with gplasync (async dxvk build)
export DXVK_ASYNC=1

export WINEPREFIX_DIR="/media/SanDisk-btrfs/Volume/Games/wine-prefix"
export COMPABILITY_TOOLS_PATH="/media/SanDisk-btrfs/Volume/Games/.compatibilitytools.d"

# Path Definitions

export PROTONPATH="$COMPABILITY_TOOLS_PATH/$PROTON_NAME"

export DXVK_OVERRIDE_PATH="$COMPABILITY_TOOLS_PATH/$DXVK_NAME"
export VKD3D_PATH="$COMPABILITY_TOOLS_PATH/$VKD3D_NAME"

export GAME_PATH="$ScDIR/$ScNAME"

export WINEPREFIX="$WINEPREFIX_DIR/$ScNAME"
export PATH="$COMPABILITY_TOOLS_PATH/$WINE_NAME/bin":$PATH

# ---------------
#! other Variables
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
export VK_PRESENT_MODE="immediate" # [ "immediate" (no_sync), "mailbox" (fast vsync) , "fifo" (enforced vsync), "FIFO_RELAXED", "SHARED_DEMAND_REFRESH", "SHARED_CONTINUOUS_REFRESH", "FIFO_LATEST_READY" ]
export WINE_FULLSCREEN_FSR=0    # Enable AMD FidelityFX Super Resolution (FSR)
export WINEESYNC=1
export WINEFSYNC=1

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
# steam-run wine "$GAME_PATH"
