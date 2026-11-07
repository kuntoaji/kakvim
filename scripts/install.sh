#!/usr/bin/env sh
# Check the requirements and link kakvim into the Neovim config folder.
# Usage: scripts/install.sh
set -eu

repo=$(cd "$(dirname "$0")/.." && pwd -P)
config="${XDG_CONFIG_HOME:-$HOME/.config}"
dest="$config/nvim"

# Neovim 0.12 or newer
if ! command -v nvim >/dev/null 2>&1; then
  echo 'Neovim not found. Install Neovim 0.12 or newer first.' >&2
  exit 1
fi
if [ "$(nvim --clean --headless +'lua io.stdout:write(vim.fn.has("nvim-0.12"))' +qa 2>/dev/null)" != 1 ]; then
  echo 'kakvim requires Neovim 0.12 or newer.' >&2
  exit 1
fi

# Check the other requirements before changing anything. Install them yourself
missing=
for tool in git rg tree-sitter cc ruby-lsp; do
  command -v "$tool" >/dev/null 2>&1 || missing="$missing $tool"
done
if [ -n "$missing" ]; then
  echo 'Error: kakvim needs these tools:' >&2
  for tool in $missing; do
    case "$tool" in
      git | cc) hint='macOS: xcode-select --install' ;;
      rg) hint='macOS: brew install ripgrep' ;;
      tree-sitter) hint='macOS: brew install tree-sitter-cli' ;;
      ruby-lsp) hint='gem install ruby-lsp, with the Ruby of your projects' ;;
    esac
    echo "  $tool ($hint)" >&2
  done
  echo 'Install them, then run this script again. On Linux, use your package manager. See Requirements in README.md' >&2
  exit 1
fi

# Link the config. Back up anything else that is already there
if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$repo/nvim" ]; then
  echo "Config already linked: $dest -> $repo/nvim"
else
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    backup="$dest.bak.$(date +%Y%m%d%H%M%S)"
    mv "$dest" "$backup"
    echo "Moved your old config to $backup"
  fi
  mkdir -p "$config"
  ln -s "$repo/nvim" "$dest"
  echo "Linked $dest -> $repo/nvim"
fi

echo 'Done. Start nvim and wait for the plugin downloads to finish.'
