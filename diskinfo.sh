#!/usr/bin/env bash
# ==========================================
# Script Name : diskinfo.sh
# Author      : <Bishal patra> (<2241016262>)
# Description : Displays disk storage information
# ==========================================

set -euo pipefail

LOG_DIR="$(dirname "$0")/../logs"
mkdir -p "$LOG_DIR"

{
  echo "[$(date)] Disk Usage Information:"
  df -h --output=source,size,used,avail,pcent | grep -vE 'tmpfs|udev'
  echo
} >> "$LOG_DIR/diskinfo.log" 2>&1

echo "✅ Disk Storage Information:"
df -h --output=source,size,used,avail,pcent | grep -vE 'tmpfs|udev'
echo "Logs saved to $LOG_DIR/diskinfo.log"
