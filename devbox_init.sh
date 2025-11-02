#!/bin/bash

echo "Initializing Devbox environment..."
export DEVBOX_HOME="$HOME/.devbox"
export PATH="$DEVBOX_HOME/bin:$PATH"
mkdir -p "$DEVBOX_HOME/bin"
echo "Devbox environment initialized at $DEVBOX_HOME"
echo "You can now use Devbox commands."
echo "To get started, run 'devbox help' for a list of commands."
echo "Devbox initialization complete."
echo "----------------------------------------"

export PATH="$DEVBOX_HOME/bin:$PATH"




