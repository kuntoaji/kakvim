#!/usr/bin/env sh
# Link kakvim into the Neovim config folder and, if you want, install ruby-lsp.
# Usage: scripts/install.sh [--with-ruby-lsp | --no-ruby-lsp]
set -eu

usage() {
  echo 'Usage: scripts/install.sh [--with-ruby-lsp | --no-ruby-lsp]' >&2
  exit 1
}

[ $# -le 1 ] || usage

ruby_lsp=ask
case "${1-}" in
  '') ;;
  --with-ruby-lsp) ruby_lsp=yes ;;
  --no-ruby-lsp) ruby_lsp=no ;;
  *) usage ;;
esac

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

# ruby-lsp is optional. Ask only when a person is at the terminal
if command -v ruby-lsp >/dev/null 2>&1; then
  echo "ruby-lsp already installed: $(command -v ruby-lsp)"
  ruby_lsp=no
elif [ "$ruby_lsp" = ask ]; then
  ruby_lsp=no
  if [ -t 0 ] && command -v ruby >/dev/null 2>&1; then
    printf 'Install ruby-lsp for %s? [y/N] ' "$(ruby -e 'print RUBY_DESCRIPTION')"
    read -r answer || answer=
    case "$answer" in
      y | Y | yes | YES) ruby_lsp=yes ;;
    esac
  fi
fi

if [ "$ruby_lsp" = yes ]; then
  gem=$(command -v gem || true)
  if [ -z "$gem" ]; then
    echo 'Skipped ruby-lsp: gem not found. Install Ruby first.' >&2
  elif [ "$gem" = /usr/bin/gem ]; then
    echo 'Skipped ruby-lsp: gem is the system Ruby. Use a version manager such as mise, then run: gem install ruby-lsp' >&2
  else
    gem install ruby-lsp
  fi
elif ! command -v ruby-lsp >/dev/null 2>&1; then
  echo 'Skipped ruby-lsp. Install it later with: gem install ruby-lsp'
fi

# Report the other requirements. Install them yourself, see Requirements in README.md
for tool in git rg tree-sitter cc; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    echo "Missing: $tool (see Requirements in README.md)"
  fi
done

echo 'Done. Start nvim and wait for the plugin downloads to finish.'
