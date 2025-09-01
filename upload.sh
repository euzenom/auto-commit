#!/bin/bash

# =========================
# CONFIGURAÇÕES
# =========================
REPO="SeuUsuario/NomeDoRepo"
# ⚠️ Altere para seu usuário/repositorio
COMMIT_MSG="Primeiro commit"
# Mensagem do commit
BRANCH="main"
# Branch principal
DIR=$(pwd)
# Diretório atual

# =========================
# VERIFICAÇÃO DO GIT
# =========================
echo "💻 Verificando Git.."
if ! command -v git &> /dev/null; then
echo "⚠️ Git não encontrado. Instalando..."
pkg update -y && pkg install git -y
else
echo "✅ Git encontrado!"
fi

# =========================
# INICIALIZAÇÃO DO REPO
# =========================
if [ ! -d "$DIR/.git" ]; then
echo "📂 Inicializando repositório Git.."
git init
else
echo "📂 Repositório Git já inicializado."
fi

# =========================
# CONFIGURANDO safe.directory
# =========================
git config --global --add safe.directory "$DIR"
echo "🔒 Diretório configurado como seguro."

# =========================
# CONFIGURANDO USUÁRIO
# =========================
git config --global user.name "SeuNome"
git config --global user.email "seuemail@example.com"
echo "📧 Usuário e email configurados (opcional)."

# =========================
# ADICIONANDO ARQUIVOS E COMMIT
# =========================
git add .
echo "➕ Adicionando arquivos.."
git commit -m "$COMMIT_MSG"
echo "📝 Commit realizado: $COMMIT_MSG"

# =========================
# PEGAR TOKEN NA HORA
# =========================
echo -n "🔑 Digite seu GitHub Personal Access Token: "
read TOKEN

# =========================
# ADICIONANDO REMOTO E PUSH
# =========================
git remote remove origin 2>/dev/null
git remote add origin https://$TOKEN@github.com/$REPO.git
git branch -M $BRANCH
echo "🚀 Enviando arquivos para GitHub.."
git push -u origin $BRANCH

echo "🎉 Upload concluído com sucesso!"
echo "💡 Lembre-se: configure REPO como seu usuario/repositorio antes de usar o script."