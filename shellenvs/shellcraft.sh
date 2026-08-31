# FUNCTIONS

# Auto-commit, with the date as a commit message.
function cmt {
    # Add all changes to staging
    git add .
    # Get the current date in ISO format
    current_date=$(date -Iseconds)
    # Commit with the current date as the message
    git commit -m "$current_date"
    # Push the changes to the remote repository
    git push
}

# ALIASES

alias vsc='code-insiders .'
alias ntb="code-insiders ~/Notebooks"
alias sec="code-insiders ~/Compliance"
