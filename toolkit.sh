#!/bin/bash

VERSION="0.1"

clear

echo "================================="
echo "       PI ARENA TOOLKIT"
echo "             v$VERSION"
echo "================================="
echo
echo "Raspberry Pi Gaming Toolkit"
echo "Created by DudeGamerBro"
echo

echo "1) Detect System"
echo "2) Detect Games"
echo "3) Apply Game Profiles"
echo "4) Controller Setup"
echo "5) Setup MangoHud"
echo "6) Restore Backups"
echo "7) Exit"
echo

read -p "Choose an option: " choice

case $choice in

1)
    echo "Running system detection..."
    ./scripts/detect_system.sh
    ;;

2)
    echo "Scanning for games..."
    ./scripts/detect_games.sh
    ;;

3)
    echo "Profile installer coming soon!"
    ;;

4)
    echo "Controller setup coming soon!"
    ;;

5)
    echo "MangoHud setup coming soon!"
    ;;

6)
    echo "Backup restore coming soon!"
    ;;

7)
    echo "Goodbye!"
    exit
    ;;

*)
    echo "Invalid option."
    ;;

esac
