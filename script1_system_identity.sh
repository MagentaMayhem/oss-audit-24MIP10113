#!/bin/bash
# Script 1: System Identity Report
# Author: Pritam Chatterjee | Roll: 24MIP10113
# Course: Open Source Software
# Chosen Software: MySQL

# --- Variables ---
STUDENT_NAME="Pritam Chatterjee"
SOFTWARE_CHOICE="MySQL"

# --- System Info ---
DISTRO=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')
KERNEL=$(uname -r)
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
DATE_NOW=$(date)

# --- Display ---
echo "========================================="
echo " Open Source Audit — $STUDENT_NAME"
echo " Software Chosen: $SOFTWARE_CHOICE"
echo " Roll Number: 24MIP10113"
echo "========================================="
echo "Distribution : $DISTRO"
echo "Kernel       : $KERNEL"
echo "User         : $USER_NAME"
echo "Home Dir     : $HOME_DIR"
echo "Uptime       : $UPTIME"
echo "Date & Time  : $DATE_NOW"
echo ""
echo "This operating system is licensed under various open-source licenses such as GPLv2 and LGPL."
echo "========================================="
