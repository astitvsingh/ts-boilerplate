#!/bin/bash

# ==============================================================
# Development Environment Setup Script
# --------------------------------------------------------------
# This script sets up the development environment for new contributors.
# 
# HOW TO RUN:
# Run this command in your terminal:
# 
#   bash ./.devenv/tools/check_gh.sh
# 
# --------------------------------------------------------------
# Copyright 2025 © Astitv Singh <https://github.com/astitvsingh>.
# Author: Astitv Singh <https://github.com/astitvsingh>
# SPDX-License-Identifier: MIT
# ==============================================================

# Ensure the script exits on errors
set -e

echo "🔍 Checking GitHub CLI installation..."

if ! command -v gh &>/dev/null;
then
  echo "❌ GitHub CLI is not installed."

  if [[ "$1" == "--auto" ]];
  then
    echo "📥 Installing GitHub CLI..."
    if [[ "$OSTYPE" == "linux-gnu"* ]];
    then
      sudo apt update && sudo apt install -y gh
    elif [[ "$OSTYPE" == "darwin"* ]];
    then
      brew install gh
    elif [[ "$OSTYPE" == "msys" ]];
    then
      choco install gh
    else
      echo "⚠️ Unsupported OS. Install GitHub CLI manually."
      exit 1
    fi
  else
    read -p "Do you want to install GitHub CLI? (y/N): " install_gh
    if [[ "$install_gh" == "y" ]];
    then
      bash "$0" --auto
    else
      echo "⚠️ Some features may not work without GitHub CLI."
    fi
  fi
else
  echo "✅ GitHub CLI is already installed: $(gh --version)"
fi
