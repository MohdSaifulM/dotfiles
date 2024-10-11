#!/bin/bash

# Start a new tmux session named 'genesiv_session'
tmux new-session -d -s genesiv_session

# 1. First window: "git"
tmux rename-window -t genesiv_session:0 'git' # Rename first window to 'git'
tmux send-keys -t genesiv_session:0 'trg' C-m  # cd to project folder using alias 'trg'
tmux send-keys -t genesiv_session:0 'lg' C-m   # Run lazygit with alias 'lg'

# 2. Second window: "servers"
tmux new-window -t genesiv_session:1 -n 'servers'  # Create a new window for servers
tmux send-keys -t genesiv_session:1 'trg' C-m      # cd to project folder using alias 'trg'

# Split the window into 8 panes
tmux split-window -v -t genesiv_session:1           # Split pane 0 vertically
tmux select-pane -t genesiv_session:1.0             # Select pane 0
tmux split-window -h -t genesiv_session:1.0         # Split horizontally
tmux select-pane -t genesiv_session:1.0             # Select pane 0
tmux split-window -h -t genesiv_session:1.0         # Split horizontally
tmux select-pane -t genesiv_session:1.2             # Select pane 2
tmux split-window -h -t genesiv_session:1.2         # Split pane 2 horizontally

tmux select-pane -t genesiv_session:1.4             # Select pane 4
tmux split-window -h -t genesiv_session:1.4         # Split pane 4 horizontally
tmux select-pane -t genesiv_session:1.4             # Select pane 7
tmux split-window -h -t genesiv_session:1.4         # Split pane 7 horizontally
tmux select-pane -t genesiv_session:1.6             # Select pane 7
tmux split-window -h -t genesiv_session:1.6         # Split pane 7 horizontally

# Run commands in each pane
tmux send-keys -t genesiv_session:1.0 'trg' C-m      # cd to project folder using alias 'trg'
tmux send-keys -t genesiv_session:1.0 'npm run start:dev' C-m
tmux send-keys -t genesiv_session:1.1 'trg' C-m      # cd to project folder using alias 'trg'
tmux send-keys -t genesiv_session:1.1 'npm run servers:dev' C-m
tmux send-keys -t genesiv_session:1.2 'trg' C-m      # cd to project folder using alias 'trg'
tmux send-keys -t genesiv_session:1.2 'npm run socket:dev' C-m
tmux send-keys -t genesiv_session:1.3 'trg' C-m      # cd to project folder using alias 'trg'
tmux send-keys -t genesiv_session:1.3 'npm run auth:dev' C-m
tmux send-keys -t genesiv_session:1.4 'trg' C-m      # cd to project folder using alias 'trg'
tmux send-keys -t genesiv_session:1.4 'npm run notifications:dev' C-m
tmux send-keys -t genesiv_session:1.5 'trg' C-m      # cd to project folder using alias 'trg'
tmux send-keys -t genesiv_session:1.5 'npm run channels:dev' C-m
tmux send-keys -t genesiv_session:1.6 'trg' C-m      # cd to project folder using alias 'trg'
tmux send-keys -t genesiv_session:1.6 'npm run react:dev' C-m
tmux send-keys -t genesiv_session:1.7 'trg' C-m      # cd to project folder using alias 'trg'
tmux send-keys -t genesiv_session:1.7 'npm run start:v2:watch' C-m

# 3. Third window: "editor"
tmux new-window -t genesiv_session:2 -n 'editor'   # Create a new window for editor
tmux send-keys -t genesiv_session:2 'trg' C-m      # cd to project folder using alias 'trg'
tmux send-keys -t genesiv_session:2 'nvim .' C-m   # Open Neovim editor

# Select first window
# tmux select-window -t genesiv_session:0

# Attach to the tmux session
tmux attach -t genesiv_session
