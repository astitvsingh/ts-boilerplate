#!/bin/bash

# ==============================================================
# Development Environment Setup Script
# --------------------------------------------------------------
# This script sets up the development environment for new contributors.
# 
# HOW TO RUN:
# Run this command in your terminal:
# 
#   bash ./.devenv/setup.sh
# 
# --------------------------------------------------------------
# Copyright 2025 © Astitv Singh <https://github.com/astitvsingh>.
# Author: Astitv Singh <https://github.com/astitvsingh>
# SPDX-License-Identifier: MIT
# ==============================================================

# Ensure the script exits on errors
set -e

echo "🚀 Initializing Development Environment Setup..."

# Ensure the script is executed from the project root
cd "$(dirname "$0")/.." || exit 1

# ==============================================================
# Step 1: Clean Previous Builds & Install Dependencies
# ==============================================================
echo "🧹 Cleaning old build artifacts..."
npx rimraf node_modules dist coverage

echo "📦 Installing dependencies..."
npm install

# ==============================================================
# Step 2: Initialize Git Flow
# ==============================================================
echo "🔄 Initializing Git Flow..."
bash ./.devenv/gitflow-init.sh

# ==============================================================
# Step 3: Authenticate GitHub CLI (Optional)
# ==============================================================
echo "🔐 Authenticating GitHub CLI..."
bash ./.devenv/gh-auth.sh || echo "⚠️ GitHub authentication skipped."

# ==============================================================
# Step 4: Setup Husky Git Hooks
# ==============================================================
echo "🐶 Setting up Husky Git hooks..."
npx husky init
git config core.hooksPath .husky

# Copy Husky Hooks
mkdir -p .husky
cp ./.devenv/pre-commit .husky/pre-commit
chmod +x .husky/pre-commit

cp ./.devenv/pre-push .husky/pre-push
chmod +x .husky/pre-push

echo "✅ Husky Git hooks installed."

# ==============================================================
# Step 5: Run Formatting & Linting Checks
# ==============================================================
echo "🎨 Running Prettier formatting..."
npx prettier --config ./configs/.prettierrc.json --ignore-path ./configs/.prettierignore --write .

echo "🔍 Running ESLint..."
npx eslint --config ./configs/.eslintrc.json --ignore-path ./configs/.eslintignore --fix .

# ==============================================================
# Step 6: Build, Test, and Generate Documentation
# ==============================================================
echo "🏗️ Running TypeScript Build..."
npm run build:all

echo "🧪 Running Tests..."
npm run test:all

echo "📖 Generating Documentation..."
npm run docify

# ==============================================================
# Setup Complete!
# ==============================================================
echo "✅ Development environment setup complete!"
echo "🚀 You are now ready to contribute."
