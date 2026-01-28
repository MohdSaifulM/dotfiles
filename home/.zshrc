# Zsh completions (must be before anything that uses compdef)
autoload -Uz compinit
compinit
# oh-my-posh config
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/tokyonight_storm.omp.json)"

# vim keybindings
bindkey -v

# aliases
alias proj="cd ~/Projects"
alias jsp="cd ~/Projects/js-fun/"
alias nvcon="nvim ~/.config/nvim"
alias nv="nvim"
alias nvide="neovide"
alias lg="lazygit"
alias la="ls -la"

alias tfinit="terraform init -backend-config backend.dev.conf"
alias tfplan="terraform plan -var-file terraform.dev.tfvars"
alias tfapply="terraform apply -var-file terraform.dev.tfvars -auto-approve"
alias tfout="terraform output"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
