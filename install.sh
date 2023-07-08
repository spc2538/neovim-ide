#!/bin/bash

log_file="logfile.log"
apt_updated=false
dependencies_packages=("curl" "wget" "git")
core_packages=("xclip" "fzf" "ripgrep" "exuberant-ctags" "rsync")

create_log_file() {
  local message="Installing neovim Debian and Ubuntu"
  echo "$message"
  echo "$message" > "$log_file"
}

log_message() {
  local message="$1"
  echo "$message"
  echo "$message" >> "$log_file"
}

check_and_install_package() {
  local package="$1"
  if ! dpkg -s "$package" >/dev/null 2>&1; then
    log_message "Package '$package' is not installed. Installing..."
    if ! $apt_updated; then
      sudo apt-get update
      apt_updated=true
    fi
    sudo apt-get install -y "$package"
    log_message "Package '$package' has been installed."
  else
    log_message "Package '$package' is already installed."
  fi
}

command_exists() {
  local command="$1"
  command -v "$command" >/dev/null 2>&1
}

check_and_install_node() {
  local node_command="node"
  local npm_command="npm"
  if command_exists "$node_command" && command_exists "$npm_command"; then
    log_message "Node.js and npm are already available."
    local node_version
    node_version=$(node --version)
    if [[ $node_version =~ ^v([0-9]+)\.([0-9]+)\.([0-9]+) ]]; then
      local major="${BASH_REMATCH[1]}"
      local minor="${BASH_REMATCH[2]}"
      local patch="${BASH_REMATCH[3]}"
      if (( major < 18 || (major == 18 && minor < 0) )); then
        local error_message="Node.js version must be 18.0.0 or above. Please reinstall Node.js."
        log_message "$error_message"
        echo "$error_message"
        exit 1
      fi
    fi
    return
  fi

  log_message "Node.js or npm is not available. Installing..."
  log_message "Setting up Node.js repository..."
  curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/nodesource.gpg >/dev/null
  echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_18.x buster main" | sudo tee /etc/apt/sources.list.d/nodesource.list
  log_message "Updating package lists..."
  sudo apt update
  log_message "Installing Node.js..."
  sudo apt install nodejs -y
  log_message "Updating package lists again..."
  sudo apt-get update
  log_message "Configuring npm..."
  npm config set prefix '~/.local/'
  mkdir -p ~/.local/bin
  echo 'export PATH=~/.local/bin/:$PATH' >> ~/.bashrc
  source ~/.bashrc
  log_message "Node.js and npm have been installed."

}

check_and_install_neovim() {
  local neovim_command="nvim"

  if command_exists "$neovim_command"; then
    log_message "Neovim already available."
    return
  fi

  log_message "Installing neovim"
  mkdir -p ~/opt
  mkdir -p ~/.local/share/fonts
  wget -O ~/.local/share/fonts/nerd.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/3270.zip
  tar xf ~/.local/share/fonts/nerd.zip -C ~/.local/share/fonts
  wget -O ~/opt/nvim.tar.gz https://github.com/neovim/neovim/releases/download/v0.9.0/nvim-linux64.tar.gz
  tar xf ~/opt/nvim.tar.gz -C ~/opt
  echo 'export PATH="$PATH:$HOME/opt/nvim-linux64/bin"' >> ~/.bashrc
  source ~/.bashrc
  mkdir -p ~/.config/nvim/
  git clone https://github.com/spc2538/neovim-ide.git ~/.config/nvim
}


create_log_file
check_and_install_node
log_message "Installing list of packages"

for package in "${dependencies_packages[@]}"; do
  check_and_install_package "$package"
done
for package in "${core_packages[@]}"; do
  check_and_install_package "$package"
done


check_and_install_neovim
