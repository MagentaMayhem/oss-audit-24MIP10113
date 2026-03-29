#!/bin/bash
# Script 4: Log File Analyzer
# Author: Pritam Chatterjee | Roll: 24MIP10113
# Chosen Software: MySQL

LOGFILE=$1
KEYWORD=${2:-"error"}   # Default keyword is 'error'
COUNT=0

echo "========================================="
echo " Log File Analyzer"
echo "========================================="

# --- Validate Input ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <log_file_path> [keyword]"
    exit 1
fi

# --- Retry if file missing or empty ---
if [ ! -f "$LOGFILE" ] || [ ! -s "$LOGFILE" ]; then
    echo "Log file is missing or empty. Retrying in 3 seconds..."
    sleep 3
fi

if [ ! -f "$LOGFILE" ]; then
    echo "ERROR: File '$LOGFILE' not found. Exiting."
    exit 1
fi

# --- Read Log File Line-by-Line ---
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo ""
echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"
echo ""

# --- Print Last 5 Matching Lines ---
echo "Last 5 matching lines:"
grep -i "$KEYWORD" "$LOGFILE" | tail -n 5

echo "========================================="
