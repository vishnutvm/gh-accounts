#!/bin/bash
# GitHub Multi-Account Manager with Installer
# Author: gh-accounts (public version)

INSTALL_PATH="/usr/local/bin/gh-accounts"
CONFIG_FILE="$HOME/.gh-accounts"
SSH_DIR="$HOME/.ssh"
SSH_CONFIG="$SSH_DIR/config"

# =============== INSTALLER ===============
if [[ "$1" == "install" ]]; then
    echo "Installing gh-accounts to $INSTALL_PATH"
    sudo cp "$0" "$INSTALL_PATH"
    sudo chmod +x "$INSTALL_PATH"
    echo "Installation complete! Run 'gh-accounts' to get started."
    exit 0
fi

mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"
touch "$CONFIG_FILE"

# =============== FUNCTIONS ===============
function list_accounts() {
    if [ ! -s "$CONFIG_FILE" ]; then
        echo "No accounts added yet."
        return
    fi
    echo "Saved GitHub Accounts:"
    awk -F"|" '{print "  - " $1 " | " $2 " | " $3}' "$CONFIG_FILE"
}

function add_account() {
    local name=$1
    local username=$2
    local email=$3
    local key_file="$SSH_DIR/id_rsa_$name"

    if [ -z "$name" ] || [ -z "$username" ] || [ -z "$email" ]; then
        echo "Usage: gh-accounts add <name> <username> <email>"
        exit 1
    fi

    echo "Adding account: $name ($username / $email)"
    if ! grep -q "^$name|" "$CONFIG_FILE" 2>/dev/null; then
        echo "$name|$username|$email" >> "$CONFIG_FILE"
    fi

    if [ ! -f "$key_file" ]; then
        ssh-keygen -t rsa -b 4096 -C "$email" -f "$key_file" -N ""
    else
        echo "Key already exists: $key_file"
    fi

    if ! grep -q "Host github-$name" "$SSH_CONFIG" 2>/dev/null; then
        echo "
Host github-$name
    HostName github.com
    User git
    IdentityFile $key_file
    IdentitiesOnly yes
" >> "$SSH_CONFIG"
    fi

    chmod 600 "$SSH_CONFIG"
    ssh-add "$key_file"

    echo "Public key for $name (add this to GitHub SSH keys):"
    cat "$key_file.pub"

    # Live verification loop
    echo "Waiting for SSH key verification..."
    until ssh -T git@github.com 2>&1 | grep -q "successfully authenticated"; do
        echo "Key not active yet. Press Ctrl+C to stop or wait..."
        sleep 5
    done
    echo "SSH key verified for $name!"
}

function switch_account() {
    local name=$1
    if [ -z "$name" ]; then
        echo "Usage: gh-accounts switch <name>"
        exit 1
    fi

    local entry=$(grep "^$name|" "$CONFIG_FILE")
    if [ -z "$entry" ]; then
        echo "Error: Account '$name' not found."
        exit 1
    fi

    IFS="|" read -r acc username email <<< "$entry"

    echo "Switching this repo to account '$acc' ($username / $email)"
    git config user.name "$username"
    git config user.email "$email"

    origin_url=$(git remote get-url origin)
    if [[ $origin_url == https*://github.com* ]]; then
        repo_path=$(echo "$origin_url" | sed -E 's#https://github.com/##')
        new_url="git@github-$acc:${repo_path}"
        git remote set-url origin "$new_url"
    fi
    echo "Repo now linked to $acc (remote updated)."
}

function interactive_switch() {
    if ! command -v fzf &>/dev/null; then
        echo "Error: fzf is not installed. Install it with 'sudo apt install fzf' or 'brew install fzf'."
        exit 1
    fi

    local choice=$(awk -F"|" '{print $1 " | " $2 " | " $3}' "$CONFIG_FILE" | fzf --prompt="Select GitHub account: " --height=10 --border)
    if [ -z "$choice" ]; then
        echo "No account selected."
        exit 1
    fi
    local name=$(echo "$choice" | awk -F"|" '{print $1}' | xargs)
    switch_account "$name"
}

function current_account() {
    local repo_path=$(git rev-parse --show-toplevel 2>/dev/null)
    if [ -z "$repo_path" ]; then
        echo "Not inside a Git repo."
        exit 1
    fi
    echo "Repo: $(basename "$repo_path")"
    echo "User: $(git config user.name)"
    echo "Email: $(git config user.email)"
    echo "Remote: $(git remote get-url origin)"
}

# =============== COMMAND HANDLER ===============
case "$1" in
    add) add_account "$2" "$3" "$4" ;;
    list) list_accounts ;;
    switch) switch_account "$2" ;;
    interactive) interactive_switch ;;
    current) current_account ;;
    install) ;; # Already handled above
    *) echo "
Usage: gh-accounts <command> [options]

Commands:
  add <alias> <username> <email>   Add a new GitHub account.
  list                             List all saved accounts.
  switch <alias>                   Switch the current repo to an account.
  interactive                      Choose an account interactively (fzf).
  current                          Show the current repo's account info.
  install                          Install gh-accounts globally.
" ;;
esac