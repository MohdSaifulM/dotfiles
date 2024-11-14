#!/bin/bash

# Kill the existing tmux session named 'genesiv_session' if it exists
tmux kill-session -t genesiv_session 2>/dev/null || true
# Start a new tmux session named 'genesiv_session'
tmux new-session -d -s genesiv_session

# 1. First window: "git"
tmux rename-window -t genesiv_session:0 'git' # Rename first window to 'git'
tmux send-keys -t genesiv_session:0 'trg' C-m  # cd to project folder using alias 'trg'
tmux send-keys -t genesiv_session:0 'lg' C-m   # Run lazygit with alias 'lg'

# 2. Second window: "servers-1"
tmux new-window -t genesiv_session:1 -n 'servers-1'
tmux send-keys -t genesiv_session:1 'trg' C-m

# Split the window into 2x2 panes
tmux split-window -v -t genesiv_session:1
tmux split-window -h -t genesiv_session:1.0
tmux select-pane -t genesiv_session:1.2
tmux split-window -h -t genesiv_session:1.2

# Run commands in each pane
tmux send-keys -t genesiv_session:1.0 'trg' C-m
tmux send-keys -t genesiv_session:1.0 'npm run start:v2:watch' C-m
tmux send-keys -t genesiv_session:1.1 'trg' C-m
tmux send-keys -t genesiv_session:1.1 'npm run servers:dev' C-m
tmux send-keys -t genesiv_session:1.2 'trg' C-m
tmux send-keys -t genesiv_session:1.2 'npm run start:v2:socket:watch' C-m
tmux send-keys -t genesiv_session:1.3 'trg' C-m
tmux send-keys -t genesiv_session:1.3 'npm run auth:dev' C-m

# 3. Third window: "servers-2"
tmux new-window -t genesiv_session:2 -n 'servers-2'
tmux send-keys -t genesiv_session:2 'trg' C-m

# Split the window into 2x2 panes
tmux split-window -v -t genesiv_session:2
tmux split-window -h -t genesiv_session:2.0
tmux select-pane -t genesiv_session:2.2
tmux split-window -h -t genesiv_session:2.2

# Run commands in each pane
tmux send-keys -t genesiv_session:2.0 'trg' C-m
tmux send-keys -t genesiv_session:2.0 'npm run notifications:dev' C-m
tmux send-keys -t genesiv_session:2.1 'trg' C-m
tmux send-keys -t genesiv_session:2.1 'npm run channels:dev' C-m
tmux send-keys -t genesiv_session:2.2 'trg' C-m
tmux send-keys -t genesiv_session:2.2 'npm run react:dev' C-m
tmux send-keys -t genesiv_session:2.3 'trg' C-m
tmux send-keys -t genesiv_session:2.3 'npm run webpack:dev' C-m

# 4. Fourth window: "servers-3"
tmux new-window -t genesiv_session:3 -n 'servers-3'
tmux send-keys -t genesiv_session:3 'trg' C-m

# Split the window into 2x2 panes
tmux split-window -v -t genesiv_session:3
tmux split-window -h -t genesiv_session:3.0
tmux select-pane -t genesiv_session:3.2
tmux split-window -h -t genesiv_session:3.2

# Run commands in each pane
tmux send-keys -t genesiv_session:3.0 'trg' C-m
tmux send-keys -t genesiv_session:3.0 'npm run start:dev' C-m
tmux send-keys -t genesiv_session:3.1 'trg' C-m
tmux send-keys -t genesiv_session:3.1 'npm run socket:dev' C-m
tmux send-keys -t genesiv_session:3.2 'trg' C-m
tmux send-keys -t genesiv_session:3.2 'cmatrix' C-m
tmux send-keys -t genesiv_session:3.3 'trg' C-m
tmux send-keys -t genesiv_session:3.3 'cmatrix' C-m

# 5. Fifth window: "editor"
tmux new-window -t genesiv_session:4 -n 'editor'   # Create a new window for editor
tmux send-keys -t genesiv_session:4 'trg' C-m      # cd to project folder using alias 'trg'
tmux send-keys -t genesiv_session:4 'nvim .' C-m   # Open Neovim editor

# Select first window
# tmux select-window -t genesiv_session:0

# Attach to the tmux session
tmux attach -t genesiv_session
