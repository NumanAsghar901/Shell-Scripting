clear

GREEN='\033[1;32m'
NC='\033[0m'


function show_menu() {
echo -e "\n${GREEN}========== Main Menu ==========${NC}"
echo "1. Generate System Report"
echo "2. Install Software"
echo "3. Exit"
echo -e "${GREEN}================================${NC}\n"
}

while true
do
show_menu
read -p "Enter your choice (1-3): " choice

case $choice in
1)
bash /home/numan-asghar/Shell-Scripting/sytem_log.sh
;;
2)
bash /home/numan-asghar/Shell-Scripting/software_installation.sh
;;
3)
echo "Exiting... Goodbye!"
exit 0
;;
*)
echo "Invalid option. Please try again."
;;
esac
done

