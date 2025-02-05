#!/bin/bash

# ==============================================================
# Development Environment Setup Script
# --------------------------------------------------------------
# This script sets up the development environment for new contributors.
# 
# HOW TO RUN:
# Run this command in your terminal:
# 
#   bash ./.devenv/tools/check_nodejs.sh
# 
# --------------------------------------------------------------
# Copyright 2025 © Astitv Singh <https://github.com/astitvsingh>.
# Author: Astitv Singh <https://github.com/astitvsingh>
# SPDX-License-Identifier: MIT
# ==============================================================

# Ensure the script exits on errors
set -e

echo "🔍 Checking Node.js & npm installation..."

if ! command -v node &>/dev/null || ! command -v npm &>/dev/null; then
  echo "❌ Node.js & npm are not installed."

  if [[ "$1" == "--auto" ]]; then
    echo "📥 Installing Node.js & npm..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      sudo apt update && sudo apt install -y nodejs npm
    elif [[ "$OSTYPE" == "darwin"* ]]; then
      brew install node
    elif [[ "$OSTYPE" == "msys" ]]; then
      choco install nodejs
    else
      echo "⚠️ Unsupported OS. Install Node.js manually."
      exit 1
    fi
  else
    read -p "Do you want to install Node.js & npm? (y/N): " install_node
    if [[ "$install_node" == "y" ]]; then
      bash "$0" --auto
    else
      echo "❌ Node.js & npm are required. Install them before proceeding."
      exit 1
    fi
  fi
else
  echo "✅ Node.js: $(node -v), npm: $(npm -v) are already installed."
fi
