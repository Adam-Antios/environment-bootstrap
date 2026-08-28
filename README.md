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

## Send Pull Request

To create a branch for a file and commit it with the file path as the commit message, use the following command:

```bash
curl -fsSL https://raw.githubusercontent.com/Adam-Antios/workspace-bootstrap/refs/heads/main/scripting/branching.sh | bash -s -- path/to/file
```

To use a date as the branch name and commit message, pass it as the second argument. The branch name uses a safe version of the date:

```bash
curl -fsSL https://raw.githubusercontent.com/Adam-Antios/workspace-bootstrap/refs/heads/main/scripting/branching.sh | bash -s -- path/to/file "$(date -Iseconds)"
```
