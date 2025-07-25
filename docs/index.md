# gh-accounts – GitHub Multi-Account Manager

`gh-accounts` is a CLI tool that simplifies managing multiple GitHub accounts on a single machine. It automates SSH key creation, Git configuration, and repository account switching.

---

## **Features**
- Manage multiple GitHub accounts easily.
- Auto-generate SSH keys and configure `~/.ssh/config`.
- Converts HTTPS remotes to SSH automatically.
- Interactive account switching (via `fzf`).
- Live SSH key verification after adding accounts.
- Self-installing with `gh-accounts install`.

---

## **Quick Installation**
```bash
curl -fsSL https://gist.githubusercontent.com/vishnutvm/f876e9c294dff5f1efe1431e85e49ad9/raw -o gh-accounts.sh
bash gh-accounts.sh install
```
Once installed, you can run `gh-accounts` globally.

---

## **Download and Install a Specific Version**
To download and install a specific version (for example, **v1.0.0**) of `gh-accounts`, follow these steps:

1. **Go to the Release Page**  
   Check your desired version on the GitHub Releases page and confirm the version number you want (e.g., **v1.0.0**).

2. **Download and Install That Version**  
   Run the following commands in your terminal:
   ```bash
   curl -fsSL https://github.com/vishnutvm/gh-accounts/releases/download/v1.0.0/gh-accounts.sh -o gh-accounts.sh
   bash gh-accounts.sh install
   ```
   - The `curl` command fetches exactly the **v1.0.0** script, not the main branch or latest changes.
   - The `install` command will set up `gh-accounts` globally on your machine.

---

## **Basic Commands**

### **Add a New Account**
```bash
gh-accounts add <alias> <github-username> <email>
```
Example:
```bash
gh-accounts add personal johndoe johndoe@example.com
```

### **List Accounts**
```bash
gh-accounts list
```

### **Switch Repository Account**
```bash
gh-accounts switch <alias>
```

### **Interactive Switch**
```bash
gh-accounts interactive
```

### **Show Current Repo Info**
```bash
gh-accounts current
```

---

## **Uninstallation**
```bash
sudo rm -f /usr/local/bin/gh-accounts
rm -f ~/.gh-accounts
```

---

## **Tips**
- Use descriptive aliases like `personal`, `work`, `projects`.
- Add SSH keys to GitHub via **Settings → SSH and GPG keys → New SSH key**.
- Run `gh-accounts verify-all` to confirm all keys are active.

---

## **About**
This page is auto-generated from the main README. Visit the [GitHub repository](https://github.com/vishnutvm/gh-accounts) for updates.
