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

# export node ca-certificates
set -Ux NODE_EXTRA_CA_CERTS /opt/homebrew/etc/ca-certificates/cert.pem

# Shell completions for uv and uvx (only if present)
if type -q uv
    uv generate-shell-completion fish | source
end
if type -q uvx
    uvx --generate-shell-completion fish | source
end

# Source your environment file
# if test -f $HOME/.local/bin/env
#     source $HOME/.local/bin/env
# end

set -Ux UV_NATIVE_TLS true
set -Ux REQUESTS_CA_BUNDLE ~/all_certs.pem
set -Ux SSL_CERT_FILE ~/all_certs.pem

# AWS Bedrock and Anthropic configuration
set -Ux AWS_PROFILE cline
set -Ux CLAUDE_CODE_USE_BEDROCK 1
set -Ux AWS_REGION us-east-1
set -Ux ANTHROPIC_MODEL 'us.anthropic.claude-sonnet-4-20250514-v1:0'
set -Ux PATH /opt/homebrew/opt/postgresql@15/bin $PATH

set -gx PATH /opt/homebrew/bin $PATH
