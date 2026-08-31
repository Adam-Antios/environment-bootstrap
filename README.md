# README

## Shell Configuration

To append the shared shell configuration to your local shell startup file, use the command that matches your shell.

### Bash

```bash
printf '\n' >> ~/.bashrc && \
curl -fsSL https://raw.githubusercontent.com/Adam-Antios/workspace-bootstrap/refs/heads/main/scripting/shellcraft.sh >> ~/.bashrc && \
source ~/.bashrc
```

### Zsh

```bash
printf '\n' >> ~/.zshrc && \
curl -fsSL https://raw.githubusercontent.com/Adam-Antios/workspace-bootstrap/refs/heads/main/scripting/shellcraft.sh >> ~/.zshrc && \
source ~/.zshrc
```

## Notebooks Workspace

To set up the **Notebooks workspace**, run the following command in your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/Adam-Antios/environment-bootstrap/refs/heads/main/scripting/notebooks.sh | bash
```

## Send Pull Request

To create a branch for one file and commit it with the filename as the commit message, run the following:

```bash
curl -fsSL https://raw.githubusercontent.com/Adam-Antios/environment-bootstrap/refs/heads/main/scripting/branching.sh | bash
```
