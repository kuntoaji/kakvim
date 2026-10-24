#!/usr/bin/env sh
# Start kakvim in a clean temporary environment and fail on any startup message.
# Run from the repository root: scripts/smoke-test.sh
set -eu

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
mkdir -p "$tmp/config"
ln -s "$PWD/nvim" "$tmp/config/nvim"

export XDG_CONFIG_HOME="$tmp/config" XDG_DATA_HOME="$tmp/data" XDG_STATE_HOME="$tmp/state" XDG_CACHE_HOME="$tmp/cache"

# First start installs the plugins from nvim-pack-lock.json and prints progress
nvim --headless +qa

# Second start must be silent: any output is an error message
out=$(nvim --headless +qa 2>&1)
if [ -n "$out" ]; then
  printf 'Startup produced output:\n%s\n' "$out" >&2
  exit 1
fi

# The lockfile must not change: every plugin in vim.pack.add() is pinned
git diff --exit-code -- nvim/nvim-pack-lock.json

echo 'OK: kakvim starts with no errors'
