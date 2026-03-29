#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Pritam Chatterjee | Roll: 24MIP10113
# Chosen Software: MySQL

echo "========================================="
echo " Disk & Permission Auditor"
echo "========================================="

# --- Directories to Audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "Directory Audit Report"
echo "-----------------------------------------"

# --- Loop Through Directories ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "$DIR => Permissions: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist on this system."
    fi
done

echo ""
echo "-----------------------------------------"
echo " MySQL Configuration Directory Audit"
echo "-----------------------------------------"

# --- Check MySQL Config for Debian/Ubuntu ---
if [ -d "/etc/mysql" ]; then
    echo "/etc/mysql detected (Debian/Ubuntu systems)."
    ls -ld /etc/mysql | awk '{print "Permissions:", $1, "Owner:", $3, "Group:", $4}'

# --- Check MySQL Config for RHEL/Fedora ---
elif [ -d "/etc/my.cnf.d" ]; then
    echo "/etc/my.cnf.d detected (RHEL/Fedora systems)."
    ls -ld /etc/my.cnf.d | awk '{print "Permissions:", $1, "Owner:", $3, "Group:", $4}'

# --- Check MySQL/MariaDB Config for Arch Linux ---
elif [ -d "/etc/mariadb" ]; then
    echo "/etc/mariadb detected (Arch Linux systems)."
    ls -ld /etc/mariadb | awk '{print "Permissions:", $1, "Owner:", $3, "Group:", $4}'

elif [ -f "/etc/my.cnf" ]; then
    echo "/etc/my.cnf detected (Arch Linux — single config file)."
    ls -l /etc/my.cnf | awk '{print "Permissions:", $1, "Owner:", $3, "Group:", $4}'

elif [ -d "/etc/mysql" ]; then
    echo "/etc/mysql detected (Arch Linux alternative)."
    ls -ld /etc/mysql | awk '{print "Permissions:", $1, "Owner:", $3, "Group:", $4}'

else
    echo "MySQL configuration directory not found."
fi

echo "========================================="
