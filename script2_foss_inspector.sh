#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Pritam Chatterjee | Roll: 24MIP10113
# Course: Open Source Software
# Chosen Software: MySQL / MariaDB (Compatible FOSS Databases)

echo "========================================="
echo " FOSS Package Inspector — MySQL/MariaDB"
echo "========================================="

# --- Detect Package Manager ---
if command -v dpkg &>/dev/null; then
    PM="dpkg"
elif command -v rpm &>/dev/null; then
    PM="rpm"
elif command -v pacman &>/dev/null; then
    PM="pacman"
else
    echo "No supported package manager found (dpkg/rpm/pacman)."
    exit 1
fi

echo "Detected package manager: $PM"
echo ""

# --- List of possible MySQL/MariaDB package names ---
CANDIDATES=("mysql-server" "mysql" "mariadb-server" "mariadb")

FOUND_PACKAGE=""

# --- Check which package is installed ---
for PKG in "${CANDIDATES[@]}"; do
    if [ "$PM" = "dpkg" ]; then
        dpkg -l | grep -q "^ii  $PKG" && FOUND_PACKAGE=$PKG && break
    elif [ "$PM" = "rpm" ]; then
        rpm -q $PKG &>/dev/null && FOUND_PACKAGE=$PKG && break
    elif [ "$PM" = "pacman" ]; then
        pacman -Q | grep -q "^$PKG" && FOUND_PACKAGE=$PKG && break
    fi
done

# --- If no matching package found ---
if [ -z "$FOUND_PACKAGE" ]; then
    echo "No MySQL or MariaDB package detected."
    echo "Checked for: mysql-server, mysql, mariadb-server, mariadb"
    echo "========================================="
    exit 0
fi

# --- Display basic info ---
echo "Detected installation: $FOUND_PACKAGE"
echo ""

if [ "$PM" = "dpkg" ]; then
    dpkg -l | grep "$FOUND_PACKAGE"
elif [ "$PM" = "rpm" ]; then
    rpm -qi "$FOUND_PACKAGE" | grep -E "Version|License|Summary"
elif [ "$PM" = "pacman" ]; then
    pacman -Qi "$FOUND_PACKAGE" | grep -E "Version|License|Description"
fi

echo ""
echo "-----------------------------------------"
echo " Philosophy Note"
echo "-----------------------------------------"

# --- Case Statement Philosophy ---
case $FOUND_PACKAGE in
    mysql-server|mysql)
        echo "MySQL: A foundational open-source database driving web applications and servers."
        ;;
    mariadb-server|mariadb)
        echo "MariaDB: A truly community-driven fork of MySQL focused on openness and performance."
        ;;
    *)
        echo "A key part of the open-source ecosystem enabling free data management."
        ;;
esac

echo "========================================="
