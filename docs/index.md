# gh-accounts
## GitHub Multi-Account Manager

**gh-accounts** is a powerful CLI tool that simplifies managing multiple GitHub accounts on a single machine. Automate SSH key creation, Git configuration, and seamlessly switch between accounts across repositories.

---

## **Features**
- Manage multiple GitHub accounts easily.
- Auto-generate SSH keys and configure `~/.ssh/config`.
- Converts HTTPS remotes to SSH automatically.
- Interactive account switching (via `fzf`).
- Live SSH key verification after adding accounts.
- Self-installing with `gh-accounts install`.


---

## Quick Installation

```bash
curl -fsSL https://gist.githubusercontent.com/vishnutvm/f876e9c294dff5f1efe1431e85e49ad9/raw -o gh-accounts.sh
bash gh-accounts.sh install
```

Once installed, run `gh-accounts` from anywhere in your terminal.

---

## Install Specific Version

### Step 1: Check Available Versions
Visit the [Releases Page](https://github.com/vishnutvm/gh-accounts/releases) to find your desired version.

### Step 2: Download & Install
```bash
# Replace v1.0.0 with your desired version
curl -fsSL https://github.com/vishnutvm/gh-accounts/releases/download/v1.0.0/gh-accounts.sh -o gh-accounts.sh
bash gh-accounts.sh install
```

---

## Commands

### Add New Account
```bash
gh-accounts add <alias> <github-username> <email>
```
**Example:**
```bash
gh-accounts add personal johndoe johndoe@example.com
gh-accounts add work jane.smith jane@company.com
```

### List All Accounts
```bash
gh-accounts list
```

### Switch Repository Account
```bash
gh-accounts switch <alias>
```

### Interactive Account Selection
```bash
gh-accounts interactive
```

### View Current Repository Info
```bash
gh-accounts current
```

### Verify All SSH Keys
```bash
gh-accounts verify-all
```

---

## Uninstallation

```bash
sudo rm -f /usr/local/bin/gh-accounts
rm -f ~/.gh-accounts
```

---

## Tips

- Use **descriptive aliases** like `personal`, `work`, `opensource`
- Add generated SSH keys to GitHub: **Settings → SSH and GPG keys → New SSH key**
- Run `gh-accounts verify-all` after setup to ensure all keys are working
- The tool automatically handles SSH config management - no manual editing needed

---

## Links

- **[GitHub Repository](https://github.com/vishnutvm/gh-accounts)**
- **[Latest Release](https://github.com/vishnutvm/gh-accounts/releases/latest)**
- **[Report Issues](https://github.com/vishnutvm/gh-accounts/issues)**

---

## Maintainer

Maintained by **[Vishnu](https://github.com/vishnutvm)**

---
