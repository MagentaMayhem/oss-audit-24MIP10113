#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Pritam Chatterjee | Roll: 24MIP10113
# Chosen Software: MySQL

echo "========================================="
echo " Open Source Manifesto Generator"
echo "========================================="
echo ""

# --- Collect User Inputs ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

DATE_NOW=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"

# --- Compose Manifesto ---
{
echo "-----------------------------------------"
echo " My Open Source Manifesto"
echo " Generated on: $DATE_NOW"
echo " Author: $(whoami)"
echo "-----------------------------------------"
echo ""
echo "I believe in the spirit of open-source software. Tools like $TOOL"
echo "show how powerful collaboration can be when knowledge is shared freely."
echo ""
echo "To me, freedom means \"$FREEDOM\" — the ability to create, modify, and"
echo "distribute software without restrictions."
echo ""
echo "One day, I want to build and freely share \"$BUILD\" with the world,"
echo "contributing to the same ecosystem that empowered me."
echo ""
echo "-----------------------------------------"
echo " End of Manifesto"
echo "-----------------------------------------"
} > "$OUTPUT"

echo ""
echo "Manifesto saved to: $OUTPUT"
echo ""
echo "========================================="
