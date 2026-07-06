#!/usr/bin/env bash

# Windows Game Executor v2.6.2
# WinePrefix is in Specified path as filename of script
# The executable run is the Filename without .sh

ScDIR=$(dirname "${BASH_SOURCE[0]}")
ScNAME=$(basename "${BASH_SOURCE[0]%.sh}")


# ---------------------------
# --- Versioning & Prefix ---
# ---------------------------

export PROTON_NAME="steam/Proton 10.0-4" # Case Sensitive
#export DXVK_NAME="github/dxvk/dxvk-3.0"
#export VKD3D_NAME="vkd3d-proton-3.0.1"


export WINEPREFIX_DIR="/media/SanDisk-btrfs/Volume/Games/wine-prefix"
export COMPABILITY_TOOLS_PATH="/media/SanDisk-btrfs/Volume/Games/.compatibilitytools.d"


# ------------------------
# --- Path Definitions ---
# ------------------------

# Proton
export PROTONPATH="$COMPABILITY_TOOLS_PATH/$PROTON_NAME"

# DXVK
#export DXVK_OVERRIDE_PATH="$COMPABILITY_TOOLS_PATH/$DXVK_NAME" # For Umu/Lutris
#export DXVK_CUSTOM_DIR="$COMPABILITY_TOOLS_PATH/$DXVK_NAME" # For Proton

# VKD3D
#export VKD3D_PATH="$COMPABILITY_TOOLS_PATH/$VKD3D_NAME"

# PATHS
export GAME_PATH="$ScDIR/$ScNAME"
export WINEPREFIX="$WINEPREFIX_DIR/$ScNAME"

#export PATH="$COMPABILITY_TOOLS_PATH/$WINE_NAME/bin":$PATH

# Cache
export DXVK_SHADER_CACHE_PATH="$WINEPREFIX/dxvk-cache"
export WINE_MONO_CACHE_DIR="$WINEPREFIX/files/cache/mono"
export WINE_GECKO_CACHE_DIR="$WINEPREFIX/files/cache/gecko"


# ---------------
# --- Display ---
# ---------------

#export PROTON_ENABLE_WAYLAND=1
export PROTON_ENABLE_HDR=1
export ENABLE_HDR_WSI=1

# HUD
#export PROTON_DLSS_INDICATOR=1
#export DXVK_HUD="devinfo,memory,api,version,fps,opacity=0.8"

# Display Mode
export VK_PRESENT_MODE="fifo_relaxed" # [ "IMMEDIATE" (no_sync), "MAILBOX" (fast vsync) , "fifo" (enforced vsync), "fifo_relaxed", "SHARED_DEMAND_REFRESH", "SHARED_CONTINUOUS_REFRESH", "FIFO_LATEST_READY" ]
export MESA_VK_WSI_PRESENT_MODE="relaxed" # [ "immediate" (no_sync), "mailbox" (fast vsync), "fifo" (enforced vsync), "relaxed" ]

# Scaling
#export WINE_FULLSCREEN_INTEGER_SCALING=1
#export WINE_FULLSCREEN_FSR=0          # Enable AMD FidelityFX Super Resolution (FSR)


# --------------------
# --- Cachy Proton ---
# --------------------

# Optiscaler
#export PROTON_USE_OPTISCALER=1
#export PROTON_OPTISCALER_NAME="d3d12.dll" # Defaults to Direct X11
#export PROTON_OPTISCALER_CONFIG="Upscalers.Dx11Upscaler=xess;Upscalers.Dx12Upscaler=xess;UpscaleRatio.UpscaleRatioOverrideValue=1.7" # [ "fsr31", "dlss", "xess" ]

export LOW_LATENCY_LAYER=1 # Low latency for Nvidia & AMD
export DXVK_HDR=1
#export PROTON_PREFER_SDL=1 # instead of steam input

# DXVK
export PROTON_DXVK_LOWLATENCY=1 # DXVK Low Latency fork
#export PROTON_D7VK_DDRAW=1 # DirectX 7 or lower

export PROTON_XESS_UPGRADE=1 # XeSS

# Nvidia
export PROTON_DLSS_UPGRADE="310.7.0" # DLSS [ 1, "310.7.0", "310.6.0", "310.5.3", "310.2.1", ]
export DXVK_NVAPI_VKREFLEX=1

# FSR
export PROTON_FSR4_UPGRADE="4.1.0" # [ 1, "4.1.0", "4.0.3", "4.0.0", "4.0.2", "4.0.1" ]
#export PROTON_FSR4_RDNA3_UPGRADE="4.0.2" # for RDNA3 gpus
#export PROTON_FSR3_UPGRADE=1


# -------------------
# --- Performance ---
# -------------------

# Async Shader Compilation ( Only use in Singleplayer Games )
# Only Activates with gplasync (async dxvk build)
export DXVK_ASYNC=1
export VKD3D_CONFIG=async # Async shader compiling for Direct3D 12 games

# CPU/GPU Sync
export WINEESYNC=1
export WINEFSYNC=1


# ---------------------------
# --- Wine/Proton Options ---
# ---------------------------

# Wine
#export WINEDLLOVERRIDES="winemenubuilder.exe=d" # Disable Desktop Menu Links
#export WINE_LARGE_ADDRESS_AWARE=1 # Allow >2GB RAM in 32-bit mode
#export WINEARCH=win64

# Proton General
export PROTON_VERB=waitforexitandrun
#export PROTON_NO_D3D10=1
#export PROTON_USE_WINED3D=1
#export PROTON_DXVK_D3D8=1 # Force Directx8 games to use DXVK


# ---------------------
# --- UMU Settings ---
# ---------------------

export GAMEID=umu-default # Game ID for extra umu tweaks
export UMU_LOG=1
export DXVK_LOG_LEVEL=error
# export STORE=none


# ------------------
# --- Anti Cheat ---
# ------------------

# Anti Cheat (Optional)
#export PROTON_BATTLEYE_RUNTIME="$HOME/.local/share/lutris/runtime/battleye_runtime" # Battleye AntiCheat Support
#export PROTON_EAC_RUNTIME="$HOME/.local/share/lutris/runtime/eac_runtime"           # Easy AntiCheat Support

# ---

echo "Starting: ( $GAME_PATH )"

umu-run "$GAME_PATH"
#steam-run wine "$GAME_PATH"

