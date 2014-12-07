#
# dotzsh : https://github.com/dotphiles/dotzsh
#
# Sets dotzsh options.
#
# Authors:
#   Ben O'Hara <bohara@gmail.com>
#

# Set the Zsh modules to load (man zshmodules).
zstyle ':dotzsh:load' zmodule 'stat'

# Set the Zsh functions to load (man zshcontrib).
zstyle ':dotzsh:load' zfunction 'zargs' 'zmv'

# Set the dotzsh modules to load (browse modules).
# The order matters.
zstyle ':dotzsh:load' dzmodule \
  'environment' \
  'terminal'    \
  'editor'      \
  'history'     \
  'completion'  \
  'theme'       \
  'fasd'

# Color output (auto set to 'no' on dumb terminals).
zstyle ':dotzsh:module:*' color 'yes'

# Setup aliases for modules (disable per module below).
zstyle ':dotzsh:module:*' aliases 'yes'

# Set case-sensitivity for completion, history lookup, etc.
zstyle ':dotzsh:module:*' case-sensitive 'no'

# Set which PAGER to use less or more
zstyle ':dotzsh:module:environment' pager 'less'

# Enable mouse scrolling in less, add the following to *zshrc*
zstyle ':dotzsh:module:environment:pager:less' mousescroll 'false'

# Auto set the tab and window titles.
zstyle ':dotzsh:module:terminal' auto-title 'yes'

# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':dotzsh:module:editor' keymap 'emacs'

# Set EDITOR to 'emacs' or 'vi'.
zstyle ':dotzsh:module:editor' editor 'vi'

# Expand global aliases automatically
zstyle ':dotzsh:module:completion' expand-global-aliases 'yes'

# SSH module
zstyle ':dotzsh:module:ssh:agent' forwarding 'yes'

# TMUX module
# Auto start a session when Zsh is launched.
# Setting it to 'local' only starts a session for local terminals.
# Setting it to 'remote' only starts a session for SSH connections.
##zstyle ':dotzsh:module:tmux' auto-start 'no'
#zstyle ':dotzsh:module:tmux:aliases' tmuxinator 'yes'

# Theme module
zstyle ':dotzsh:module:theme' theme 'steeef'

# Load dotzsh
source "$DOTZSH/init.zsh"
