#!/usr/bin/env bash
# ==========================================
# Script Name : logwatch.sh
# Author      : <Bishal patra> (<2241016262>)
# Description : Monitors system logs for errors/warnings
# ==========================================

set -euo pipefail

LOG_FILE="/var/log/syslog"
LOG_DIR="$(dirname "$0")/../logs"
OUT_LOG="$LOG_DIR/logwatch.log"

mkdir -p "$LOG_DIR"

echo "[$(date)] Checking $LOG_FILE for issues..." >> "$OUT_LOG"

grep -iE "error|fail|warning" "$LOG_FILE" >> "$OUT_LOG" || {
  echo "[$(date)] No errors found." >> "$OUT_LOG"
}

echo "✅ Log monitoring completed. See logs/logwatch.log"