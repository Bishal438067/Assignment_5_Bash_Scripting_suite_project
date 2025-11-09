#!/usr/bin/env bash
# ==========================================
# Script Name : main.sh
# Author      : <Bishal patra> (2241016262)
# Description : Interactive menu for maintenance suite
# ==========================================

set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR="$BASE_DIR/scripts"
LOG_DIR="$BASE_DIR/logs"
mkdir -p "$LOG_DIR"

while true; do
  clear
  echo "======================================================"
  echo "  System Maintenance Dashboard - Pradyush Mohapatra" 
  echo "======================================================"
  echo " SYSTEM MAINTENANCE MENU"
  echo "=============================="
  echo "1. Backup Files"
  echo "2. System Update and Cleanup"
  echo "3. Log Monitoring"
  echo "4. Disk Storage Information"
  echo "5. System Information"
  echo "6. Run All Tasks"
  echo "7. Exit"
  echo "=============================="
  read -rp "Enter your choice [1-7]: " choice

  case "$choice" in
    1)
      bash "$SCRIPTS_DIR/backup.sh"
      read -rp "Press Enter to continue..."
      ;;
    2)
      bash "$SCRIPTS_DIR/update-clean.sh"
      read -rp "Press Enter to continue..."
      ;;
    3)
      bash "$SCRIPTS_DIR/logwatch.sh"
      read -rp "Press Enter to continue..."
      ;;
    4)
      bash "$SCRIPTS_DIR/diskinfo.sh"
      read -rp "Press Enter to continue..."
      ;;
    5)
      bash "$SCRIPTS_DIR/sysinfo.sh"
      read -rp "Press Enter to continue..."
      ;;
    6)
      bash "$SCRIPTS_DIR/backup.sh"
      bash "$SCRIPTS_DIR/update-clean.sh"
      bash "$SCRIPTS_DIR/logwatch.sh"
      bash "$SCRIPTS_DIR/diskinfo.sh"
      bash "$SCRIPTS_DIR/sysinfo.sh"
      echo "✅ All maintenance tasks completed!"
      read -rp "Press Enter to continue..."
      ;;
    7)
      echo "Exiting... Goodbye!"
      exit 0
      ;;
    *)
      echo "Invalid choice. Try again."
      sleep 1
      ;;
  esac
done
