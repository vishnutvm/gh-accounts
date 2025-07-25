# gh-accounts – GitHub Multi-Account Manager

`gh-accounts` is a CLI tool that simplifies managing multiple GitHub accounts on a single machine. It automates SSH key creation, Git configuration, and switching between accounts.

---

## **Features**
- Manage multiple GitHub accounts easily.
- Auto-generate SSH keys and configure `~/.ssh/config`.
- Converts HTTPS remotes to SSH automatically.
- Interactive account switching (via `fzf`).
- Live SSH key verification after adding accounts.
- Self-installing with `gh-accounts install`.

---

## **Installation**
```bash
curl -fsSL https://gist.githubusercontent.com/vishnutvm/f876e9c294dff5f1efe1431e85e49ad9/raw -o gh-accounts.sh
bash gh-accounts.sh install
```
Once installed, you can run `gh-accounts` globally.

---

## **Usage**

### **Add a New Account**
```bash
gh-accounts add <alias> <github-username> <email>
```
Example:
```bash
gh-accounts add personal johndoe johndoe@example.com
```
This will:
- Create `~/.ssh/id_rsa_<alias>`.
- Configure SSH with `Host github-<alias>`.
- Display the public key for you to add to GitHub.
- Wait until GitHub accepts the key.

---

### **List Accounts**
```bash
gh-accounts list
```
Displays saved accounts.

---

### **Switch Repository Account**
From inside any Git repository:
```bash
gh-accounts switch <alias>
```
Updates `user.name`, `user.email`, and converts the remote URL to SSH.

---

### **Interactive Switch**
```bash
gh-accounts interactive
```
Uses `fzf` to pick an account.

---

### **Show Current Repo Info**
```bash
gh-accounts current
```
Displays the current Git user and remote.

---

## **Verification**
To verify SSH keys for all accounts:
```bash
gh-accounts verify-all
```

---

## **Uninstall**
```bash
sudo rm -f /usr/local/bin/gh-accounts
rm -f ~/.gh-accounts
```

---

## **Tips**
- Use descriptive aliases like `personal`, `work`, `projects`.
- Add SSH keys to GitHub via **Settings → SSH and GPG keys → New SSH key**.
- Run `gh-accounts verify-all` to confirm all keys are active.
