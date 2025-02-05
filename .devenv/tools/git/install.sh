#!/bin/bash

# ==============================================================
# Git Installation & Version Check
# --------------------------------------------------------------
# This script checks if Git is installed and installs/upgrades
# it to the provided version if necessary.
#
# DIRECT USAGE:
#   bash ./.devenv/tools/install_git.sh [VERSION]
#
# SCRIPT USAGE:
#   bash ./.devenv/tools/install_git.sh [VERSION]
#
# PARAMETERS:
#   - VERSION (optional) : Specify a Git version (default: latest)
#
# --------------------------------------------------------------
# Copyright 2025 © Astitv Singh <https://github.com/astitvsingh>.
# Author: Astitv Singh <https://github.com/astitvsingh>
# SPDX-License-Identifier: MIT
# ==============================================================

# Ensure the script exits on errors
set -e

GIT_VERSION=${1:-"latest"}  # Default to latest if no version is provided

echo "🔍 Checking Git installation..."

# Check if Git is installed
if ! command -v git &>/dev/null; then
  echo "❌ Git is not installed."
  INSTALL_NEEDED=true
else
  CURRENT_VERSION=$(git --version | awk '{print $3}')
  echo "✅ Git is installed: version $CURRENT_VERSION"
  
  if [[ "$GIT_VERSION" != "latest" && "$CURRENT_VERSION" != "$GIT_VERSION" ]]; then
    echo "⚠️ Git version mismatch (Installed: $CURRENT_VERSION, Expected: $GIT_VERSION)."
    INSTALL_NEEDED=true
  else
    echo "✅ Git version is up-to-date."
    exit 0
  fi
fi

# Proceed with installation or upgrade
if [[ "$INSTALL_NEEDED" == "true" ]]; then
  echo "📥 Installing Git $GIT_VERSION..."
  
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt update
    if [[ "$GIT_VERSION" == "latest" ]]; then
      sudo apt install -y git
    else
      sudo apt install -y git="$GIT_VERSION"
    fi
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew update
    if [[ "$GIT_VERSION" == "latest" ]]; then
      brew install git
    else
      brew install git@"$GIT_VERSION"
    fi
  elif [[ "$OSTYPE" == "msys" ]]; then
    if [[ "$GIT_VERSION" == "latest" ]]; then
      choco install git
    else
      choco install git --version="$GIT_VERSION"
    fi
  else
    echo "⚠️ Unsupported OS. Please install Git manually."
    exit 1
  fi
fi

# Verify Installation
if command -v git &>/dev/null; then
  echo "✅ Git successfully installed: $(git --version)"
else
  echo "❌ Git installation failed. Please try manually."
  exit 1
fi
