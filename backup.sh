#!/usr/bin/env bash
# ==========================================
# Script Name : backup.sh
# Author      : <Bishal patra> (<2241016262>)
# Description : Creates a backup using rsync
# ==========================================


set -euo pipefail

SOURCE="$HOME/Documents"
DEST="$HOME/backups/backup_$(date +%Y-%m-%d_%H-%M-%S)"
LOG_DIR="$(dirname "$0")/../logs"
mkdir -p "$DEST" "$LOG_DIR"

{
  echo "[$(date)] Starting backup..."
  rsync -avh --progress "$SOURCE/" "$DEST/"
  echo "[$(date)] Backup completed successfully."
} >> "$LOG_DIR/backup.log" 2>&1

echo "✅ Backup done! Files saved in: $DEST"