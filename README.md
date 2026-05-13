# WSL2 Ultimate Dev Setup

Script de configuração automatizada para um ambiente de desenvolvimento completo no WSL2.

## O que é instalado

**Shell & Terminal**
- [Zsh](https://www.zsh.org/) como shell padrão
- [Oh My Zsh](https://ohmyz.sh/) com plugins essenciais
- [Starship](https://starship.rs/) com o preset **Tokyo Night**
- [JetBrainsMono Nerd Font](https://www.nerdfonts.com/)

**Plugins do Zsh**
- `zsh-autosuggestions` — sugestões baseadas no histórico
- `zsh-syntax-highlighting` — highlighting de comandos em tempo real
- `zsh-completions` — completions adicionais
- `fzf-tab` — navegação fuzzy no autocomplete

**Ferramentas CLI**
| Ferramenta | Descrição |
|---|---|
| `eza` | `ls` moderno com ícones |
| `bat` / `batcat` | `cat` com syntax highlighting |
| `ripgrep` | busca rápida em arquivos |
| `fd-find` | `find` moderno |
| `fzf` | fuzzy finder |
| `btop` / `htop` | monitores de sistema |
| `tmux` | multiplexador de terminal |
| `neovim` | editor de texto |
| `jq` | processador de JSON |
| `tree` | visualização de diretórios |

**Runtime**
- [NVM](https://github.com/nvm-sh/nvm) + Node.js LTS

## Uso

```bash
chmod +x setup.sh
./setup.sh
```

Após a execução:

1. Abra o **Windows Terminal** → Settings → Profiles → seu perfil WSL
2. Em **Appearance**, selecione a fonte `JetBrainsMono Nerd Font`
3. Reinicie o WSL2:

```powershell
wsl --shutdown
```

## Aliases configurados

| Alias | Comando |
|---|---|
| `ls` | `eza --icons` |
| `ll` | `eza -lah --icons` |
| `la` | `eza -a --icons` |
| `cat` | `batcat` |
| `v` | `nvim` |
| `c` | `clear` |

## Requisitos

- WSL2 com Ubuntu
- Acesso à internet
- `sudo` configurado
