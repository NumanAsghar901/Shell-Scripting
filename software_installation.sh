
clear 

GREEN='\033[1;32m'
NC='\033[0m'

#======================
# Update System First
#======================
update_system() {
    echo "${GREEN}Updating system...${NC}"
    sudo apt update && sudo apt upgrade -y
}

function menu(){

    echo -e "\n${GREEN}========== Software Installation Menu ==========${NC}"
    echo "1. Docker"
    echo "2. Python 3 + pip"
    echo "3. Ansible"
    echo "4. Terraform"
    echo "5. GitLab Runner"
    echo "6. GitHub CLI"
    echo "7. Google Chrome"
    echo "8. VS Code"
    echo "9. Update System Only"
    echo "0. Exit"
      echo -e "${GREEN}=============================================${NC}"
    }

#======================
# Installation Functions
#======================
install_docker() {
    echo -e "${GREEN}Installing Docker...${NC}"
    sudo apt install -y ca-certificates curl gnupg lsb-release
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
    https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo usermod -aG docker $USER
    echo "✅ Docker installed. You may need to restart your terminal."
}

install_python() {
    echo -e "${GREEN}Installing Python 3 and pip...${NC}"
    sudo apt install -y python3 python3-pip
}

install_ansible() {
    echo -e "${GREEN}Installing Ansible..."
    sudo apt install -y ansible
}

install_terraform() {
    echo -e "${GREEN}Installing Terraform...${NC}"
    sudo apt install -y gnupg software-properties-common curl
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update
    sudo apt install -y terraform
}

install_gitlab() {
    echo -e "${GREEN}Installing GitLab Runner...${NC}"
    curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
    sudo apt install -y gitlab-runner
}

install_github() {
    echo -e "${GREEN}Installing GitHub CLI...${NC}"
    type -p curl >/dev/null || sudo apt install curl -y
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update
    sudo apt install -y gh
}

install_chrome() {
    echo -e "${GREEN}Installing Google Chrome...${NC}"
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install -y ./google-chrome-stable_current_amd64.deb
    rm google-chrome-stable_current_amd64.deb
}

install_vscode() {
    echo -e "${GREEN}Installing VS Code via Snap...${NC}"
    sudo snap install code --classic
}

#======================
# Menu
#======================
while true
do

menu
read -p "Enter your choice (0-9): " choice

case $choice in
        1) install_docker ;;
        2) install_python ;;
        3) install_ansible ;;
        4) install_terraform ;;
        5) install_gitlab ;;
        6) install_github ;;
        7) install_chrome ;;
        8) install_vscode ;;
        9) update_system ;;
        0) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
esac

echo ""
read -p "Press Enter to return to the menu..."
clear
done

