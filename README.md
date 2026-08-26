# README

## Notebooks Workspace

To set up the **Notebooks workspace**, run the following command in your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/Adam-Antios/workspace-bootstrap/refs/heads/main/scripting/notebooks.sh | bash
```

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
