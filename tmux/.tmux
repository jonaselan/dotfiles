# Changing ctrl b to ctrl a as the command button
# unbind C-b
# set -g prefix C-a

# clear bindings
#unbind '"'
#unbind %

# load in the pretty tmuxline
#if-shell "test -f ~/.tmuxline" "source ~/.tmuxline"

# nicer prefix
#set -g prefix C-Space
#bind Space send-prefix

set-option -g default-shell /bin/zsh

# do like terminator
bind -n C-E split-window -h
bind -n C-S-Left resize-pane -L 2
bind -n C-S-Right resize-pane -R 2
bind -n C-S-Up resize-pane -U 2
bind -n C-S-Down resize-pane -D 2
bind -n C-O split-window -v

# move panes without prefix
bind -n 'M-Left' select-pane -L
bind -n 'M-Down' select-pane -D
bind -n 'M-Up' select-pane -U
bind -n 'M-Right' select-pane -R

# Show tmux positions in titles
set -g set-titles on

# Using the mouse to switch panes
set -g mouse on

# set first window to index 1 (not 0) to map more to the keyboard layout
set -g base-index 1
set -g pane-base-index 1

# Ctrl - w or w to kill panes
unbind w
unbind C-w
bind-key w kill-pane
bind-key C-w kill-pane

# C + control q to kill session
unbind q
unbind C-q
bind-key q kill-session
bind-key C-q kill-session

# Visual Activity Monitoring between windows
setw -g monitor-activity on
set -g visual-activity on

# Copy from tmux to system clipboard
# bind -t vi-copy y copy-pipe "xclip -sel clip -i"


# Freshness
set -g status-bg '#4e4e4e'
set -g status-fg '#ffffff'
set -g status-left-length 50
set -g status-right '#{prefix_highlight}#{?pane_synchronized,#[bg=#06d98d]#[fg=#111111] S ,}#[bg=#bbbbbb]#[fg=#111111] #(date +"%Y-%m-%d %H:%M") '

set -g window-status-format '#I #W'
set -g window-status-current-format '#{?window_zoomed_flag,#[bg=#06d98d],} #I #W '
setw -g window-status-current-style bg='#bbbbbb',fg='#111111'
set -g pane-active-border-style fg='#bbbbbb'
set -g pane-border-style fg='#555555'

#####################################
# Plugins
####################################

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-yank'

# Check for tpm and install if not exists
if "test ! -d ~/.tmux/plugins/tpm" \
     "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm'"

# initialize TMUX plugin manager
run '~/.tmux/plugins/tpm/tpm'


