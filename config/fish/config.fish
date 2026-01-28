if status is-interactive
    # Interactive session commands go here
end

# Oh My Posh config (Fish syntax)
if type -q brew
    if test -f (brew --prefix oh-my-posh)/themes/catppuccin_frappe.omp.json
        oh-my-posh init fish --config (brew --prefix oh-my-posh)/themes/catppuccin_frappe.omp.json | source
    end
end

# Vim keybindings (Fish uses this function)
fish_vi_key_bindings

# Aliases
alias proj='cd ~/Projects'
alias jsp='cd ~/Projects/js-fun/'
alias nvcon='nvim ~/.config/nvim'
alias nv='nvim'
alias nvide='neovide'
alias lg='lazygit'
alias la='ls -la'
alias tfinit='terraform init -backend-config backend.dev.conf'
alias tfplan='terraform plan -var-file terraform.dev.tfvars'
alias tfapply='terraform apply -var-file terraform.dev.tfvars -auto-approve'
alias tfout='terraform output'

# Conda initialize (Fish-specific)
if test -f /opt/homebrew/Caskroom/miniforge/base/bin/conda
    eval (/opt/homebrew/Caskroom/miniforge/base/bin/conda 'shell.fish' 'hook')
else if test -f /opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.fish
    source /opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.fish
else
    set -Ux PATH /opt/homebrew/Caskroom/miniforge/base/bin $PATH
end

# Shell completions for uv and uvx (only if present)
if type -q uv
    uv generate-shell-completion fish | source
end
if type -q uvx
    uvx --generate-shell-completion fish | source
end

set -Ux UV_NATIVE_TLS true

set -gx PATH /opt/homebrew/bin $PATH
