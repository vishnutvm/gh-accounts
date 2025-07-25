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

## **Installation**

### **Quick Installation**
Use the raw GitHub URL to download and install directly:
```bash
curl -fsSL https://raw.githubusercontent.com/vishnutvm/gh-accounts/main/gh-accounts.sh -o gh-accounts.sh
bash gh-accounts.sh install
```
Once installed, you can run `gh-accounts` globally.

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
