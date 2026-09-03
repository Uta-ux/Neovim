#!/bin/bash

# Diretório atual do script (o repositório clonado)
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NVIM_CONFIG_DIR="$HOME/.config/nvim"
NVIM_BACKUP_DIR="$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"

echo "Iniciando a instalação da configuração do Neovim..."

# Fazer backup se o diretório já existir
if [ -e "$NVIM_CONFIG_DIR" ]; then
    if [ -L "$NVIM_CONFIG_DIR" ] && [ "$(readlink -f "$NVIM_CONFIG_DIR")" = "$REPO_DIR" ]; then
        echo "✅ A configuração já está instalada e apontando para este repositório."
        exit 0
    else
        echo "📦 Fazendo backup da configuração existente para: $NVIM_BACKUP_DIR"
        mv "$NVIM_CONFIG_DIR" "$NVIM_BACKUP_DIR"
    fi
fi

# Criar o diretório pai, se necessário
mkdir -p "$HOME/.config"

# Criar o link simbólico
echo "🔗 Criando link simbólico de $REPO_DIR para $NVIM_CONFIG_DIR..."
ln -s "$REPO_DIR" "$NVIM_CONFIG_DIR"

echo "✨ Instalação concluída com sucesso!"
echo "🚀 Abra o terminal e digite 'nvim' para iniciar. Os plugins serão carregados automaticamente."
