#!/usr/bin/env bash

# =========================================================
# macOS Ultimate Dev Setup
# ZSH + Oh My Zsh + Starship + Tokyo Night + NVM
# =========================================================

set -e

# =========================================================
# HOMEBREW
# =========================================================

echo "🍺 Verificando Homebrew..."

if ! command -v brew &>/dev/null; then
  echo "📦 Instalando Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "📦 Atualizando Homebrew..."
brew update && brew upgrade

echo "📦 Instalando dependências..."
brew install \
  zsh \
  curl \
  wget \
  git \
  unzip \
  zip \
  htop \
  btop \
  tree \
  jq \
  ripgrep \
  fd \
  fzf \
  bat \
  eza \
  tmux \
  neovim \
  python3

# =========================================================
# JETBRAINS MONO NERD FONT
# =========================================================

echo "🔤 Instalando JetBrainsMono Nerd Font..."

brew install --cask font-jetbrains-mono-nerd-font

# =========================================================
# OH MY ZSH
# =========================================================

echo "🐚 Instalando Oh My Zsh..."

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# =========================================================
# ZSH PLUGINS
# =========================================================

echo "🔌 Instalando plugins..."

ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

git clone https://github.com/zsh-users/zsh-autosuggestions \
${ZSH_CUSTOM}/plugins/zsh-autosuggestions || true

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting || true

git clone https://github.com/Aloxaf/fzf-tab \
${ZSH_CUSTOM}/plugins/fzf-tab || true

git clone https://github.com/zsh-users/zsh-completions \
${ZSH_CUSTOM}/plugins/zsh-completions || true

# =========================================================
# STARSHIP
# =========================================================

echo "⭐ Instalando Starship..."

curl -sS https://starship.rs/install.sh | sh -s -- -y

mkdir -p ~/.config

echo "🎨 Aplicando preset Tokyo Night..."

starship preset tokyo-night -o ~/.config/starship.toml

# =========================================================
# NVM + NODE
# =========================================================

echo "🟢 Instalando NVM..."

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

export NVM_DIR="$HOME/.nvm"

source "$NVM_DIR/nvm.sh"

echo "⬢ Instalando Node.js LTS..."

nvm install --lts
nvm use --lts
nvm alias default 'lts/*'

# =========================================================
# ZSHRC
# =========================================================

echo "⚙️ Configurando .zshrc..."

FZF_PREFIX="$(brew --prefix fzf)"

cat > ~/.zshrc << EOF
export ZSH="\$HOME/.oh-my-zsh"

ZSH_THEME=""

plugins=(
  git
  docker
  docker-compose
  npm
  node
  sudo
  macos
  history
  colored-man-pages
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
  fzf-tab
)

source \$ZSH/oh-my-zsh.sh

# Starship
eval "\$(starship init zsh)"

# Aliases
alias ls="eza --icons"
alias ll="eza -lah --icons"
alias la="eza -a --icons"
alias cat="bat"
alias v="nvim"
alias c="clear"

# History
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

# Better completion
autoload -Uz compinit && compinit

# FZF
source "${FZF_PREFIX}/shell/key-bindings.zsh"
source "${FZF_PREFIX}/shell/completion.zsh"

# NVM
export NVM_DIR="\$HOME/.nvm"
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"
[ -s "\$NVM_DIR/bash_completion" ] && \. "\$NVM_DIR/bash_completion"
EOF

# =========================================================
# TMUX
# =========================================================

echo "🧩 Configurando tmux..."

cat > ~/.tmux.conf << 'EOF'
set -g mouse on
set -g history-limit 10000
setw -g mode-keys vi
EOF

# =========================================================
# DEFAULT SHELL
# =========================================================

echo "🔁 Definindo zsh como padrão..."

chsh -s $(which zsh)

# =========================================================
# FINAL
# =========================================================

echo ""
echo "✅ Ambiente configurado!"
echo ""
echo "📌 IMPORTANTE:"
echo "Abra o seu terminal (iTerm2, Terminal ou outro)"
echo "Selecione a fonte:"
echo "👉 JetBrainsMono Nerd Font"
echo ""
echo "🚀 Reinicie o terminal"
echo ""
