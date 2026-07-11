#!/bin/bash

echo "================================="
echo " Pi Arena Toolkit - System Detect"
echo "================================="
echo

# Raspberry Pi Model
if [ -f /proc/device-tree/model ]; then
    MODEL=$(tr -d '\0' < /proc/device-tree/model)
    echo "Device: $MODEL"
else
    echo "Device: Unknown"
fi

# Operating System
if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "OS: $PRETTY_NAME"
else
    echo "OS: Unknown"
fi

# Kernel
echo "Kernel: $(uname -r)"

# Architecture
echo "Architecture: $(uname -m)"

echo
echo "Installed Software"
echo "------------------"

# Helper function for Flatpak apps
check_flatpak() {
    flatpak info "$1" >/dev/null 2>&1
}

# Flatpak
if command -v flatpak >/dev/null 2>&1; then
    echo "✓ Flatpak"
else
    echo "✗ Flatpak"
fi

# MangoHud
if command -v mangohud >/dev/null 2>&1; then
    echo "✓ MangoHud"
else
    echo "✗ MangoHud"
fi

# AntiMicroX
if command -v antimicrox >/dev/null 2>&1; then
    echo "✓ AntiMicroX"
else
    echo "✗ AntiMicroX"
fi

# Xonotic (Flatpak)
if check_flatpak org.xonotic.Xonotic; then
    echo "✓ Xonotic (Flatpak)"
else
    echo "✗ Xonotic"
fi

# Cartridges (Flatpak)
if check_flatpak page.kramo.Cartridges; then
    echo "✓ Cartridges (Flatpak)"
else
    echo "✗ Cartridges"
fi

# RetroArch (Flatpak)
if check_flatpak org.libretro.RetroArch; then
    echo "✓ RetroArch (Flatpak)"
fi

echo
echo "System detection complete."