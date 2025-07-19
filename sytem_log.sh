
clear

GREEN='\033[1;32m'
NC='\033[0m'

function show_menu() {
  echo -e "${GREEN}\n========== SYSTEM INFORMATION MENU ==========${NC}"
  echo "1. Show system uptime"
  echo "2. Show current user"
  echo "3. Show OS name"
  echo "4. Show CPU specifications"
  echo "5. Show disk partitions"
  echo "6. Show disk usage"
  echo "7. Show RAM and swap usage"
  echo "8. -> Show full report"
  echo "9. Exit"
  echo -e "${GREEN}=============================================${NC}"
}

function show_uptime() {
  echo -e "\n${GREEN}System Uptime:${NC}"
  uptime
  uptime -p
}

function show_user() {
  echo -e "\n${GREEN}Current User:${NC}"
  whoami
}

function show_os() {
  echo -e "\n${GREEN}OS Name:${NC}"
  uname
}

function show_cpu() {
  echo -e "\n${GREEN}CPU Specifications:${NC}"
  lscpu | head -n 17
}

function show_partitions() {
  echo -e "\n${GREEN}Disk Partitions (Last 5 Entries):${NC}"
  lsblk | tail -n 5
}

function show_disk_usage() {
  echo -e "\n${GREEN}Disk Usage:${NC}"
  df -h
}

function show_ram() {
  echo -e "\n${GREEN}RAM and Swap Usage:${NC}"
  free -h
}

function show_full_report() {
echo -e "\n${GREEN}<------ Full system report ------>${NC}"
  show_uptime
  show_user
  show_os
  show_cpu
  show_partitions
  show_disk_usage
  show_ram
}

# Main loop
while true; do
  show_menu
  read -p "Enter your choice (1-9): " choice

  case $choice in
    1) show_uptime ;;
    2) show_user ;;
    3) show_os ;;
    4) show_cpu ;;
    5) show_partitions ;;
    6) show_disk_usage ;;
    7) show_ram ;;
    8) show_full_report ;;
    9) echo "Exiting..."; break ;;
    *) echo "Invalid choice. Please select between 1-9." ;;
  esac

  echo -e "\nPress Enter to continue..."
  read
  clear
done

