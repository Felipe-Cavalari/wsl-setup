# Starship Configs — Node.js | Go | Python/venv

Presets testados com suporte às três linguagens. Todos requerem **Nerd Font** instalada no terminal.

## Instalar Starship

```bash
curl -sS https://starship.rs/install.sh | sh
```

Adicione ao `~/.zshrc`:
```bash
eval "$(starship init zsh)"
```

## Comparativo

| Preset | Powerline | Node | Go | Python/venv | Estilo |
|---|---|---|---|---|---|
| `nerd-font-symbols` | — | ✅ | ✅ | ✅ | Clean / minimalista |
| `pastel-powerline` | ✅ | ✅ | ✅ | ✅ | Colorido suave |
| `tokyo-night` | ✅ | ✅ | ✅ | — | Dark elegante |
| `gruvbox-rainbow` | ✅ | ✅ | ✅ | ✅ | Vibrante / rico |
| `catppuccin-powerline` | ✅ | ✅ | ✅ | ✅ | Catppuccin palette |
| `jetpack` | — | ✅ | ✅ | ✅ | Minimalista + right-prompt |
| `custom` | — | ✅ | ✅ | ✅ | Manual / sem deps extras |

## Aplicar um preset

```bash
# Trocar "PRESET_NAME" pelo nome desejado
starship preset PRESET_NAME -o ~/.config/starship.toml
```

## Testar sem perder a config atual

```bash
cp ~/.config/starship.toml ~/.config/starship.toml.bak      # salva backup
starship preset tokyo-night -o ~/.config/starship.toml       # testa preset
cp ~/.config/starship.toml.bak ~/.config/starship.toml       # restaura
```

## Arquivos nesta pasta

| Arquivo | Descrição |
|---|---|
| `nerd-font-symbols.toml` | Ícones Nerd Font, sem powerline |
| `pastel-powerline.toml` | Segmentos pastel com powerline |
| `tokyo-night.toml` | Dark theme Tokyo Night |
| `gruvbox-rainbow.toml` | Arco-íris estilo Gruvbox |
| `catppuccin-powerline.toml` | Powerline com paleta Catppuccin |
| `jetpack.toml` | Minimalista com right-prompt |
| `custom.toml` | Config manual focada em Node+Go+Python |
