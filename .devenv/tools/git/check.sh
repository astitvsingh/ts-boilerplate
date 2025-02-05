#!/bin/bash

# ==============================================================
# 📌 Function: git_check
# --------------------------------------------------------------
# This script checks whether Git is installed and verifies
# if its version matches the required version.
#
# ✅ USAGE:
#   1️⃣ From another script:
#       source ./.devenv/tools/git/check.sh
#       git_check "2.34.1"
#
#   2️⃣ Directly from CLI:
#       bash ./.devenv/tools/git/check.sh "2.34.1"
#
# ✅ PARAMETERS:
#   - REQUIRED_VERSION (optional): Expected Git version (default: "latest").
#
# ✅ RETURNS:
#   - INSTALLED (bool)        : `true` if Git is installed, `false` otherwise.
#   - VERSION_MATCH (bool)    : `true` if installed version matches required.
#   - INSTALLED_VERSION (str) : Installed Git version (e.g., "2.34.1").
#
# ✅ EXPORTS:
#   These values are exported for use in other scripts.
#
# ✅ EXAMPLES:
#   # Test from CLI
#   bash ./.devenv/tools/git/check.sh "2.34.1"
#
#   # Source from another script
#   source ./.devenv/tools/git/check.sh
#   git_check "2.34.1"
#   echo "Git Installed: $INSTALLED, Version: $INSTALLED_VERSION"
#
# --------------------------------------------------------------
# 🔒 License:
# Copyright 2025 © Astitv Singh <https://github.com/astitvsingh>
# SPDX-License-Identifier: MIT
# ==============================================================

# --------------------------------------------------------------
# ⚠️ Ensure the script exits immediately if any command fails.
# --------------------------------------------------------------
set -e

# --------------------------------------------------------------
# 🛠️ Function: git_check
# --------------------------------------------------------------
# 🔹 Checks whether Git is installed.
# 🔹 Determines if its version matches the required version.
# 🔹 Exports relevant status variables.
# --------------------------------------------------------------
# 🛠️ Parameters:
#   - $1 (optional) → REQUIRED_VERSION (default: "latest")
# --------------------------------------------------------------
git_check() {
  # Read the required Git version from arguments; default is "latest".
  local REQUIRED_VERSION=${1:-"latest"}

  # Define default values for Git status variables.
  INSTALLED=false        # Is Git installed?
  VERSION_MATCH=false    # Does Git version match the required version?
  INSTALLED_VERSION="none"  # Stores the installed Git version.

  echo "🔍  Checking Git installation..."

  # --------------------------------------------------------------
  # 🚀 Step 1: Check if Git is installed using `command -v`
  # --------------------------------------------------------------
  # ✅ `command -v git`: Checks if `git` exists in system PATH.
  # ✅ `&>/dev/null`: Suppresses output (used for silent checks).
  # --------------------------------------------------------------
  if command -v git &>/dev/null; then
    INSTALLED=true  # Git is installed.
    
    # Fetch the installed Git version.
    # `git --version` prints something like: "git version 2.34.1"
    # `awk '{print $3}'` extracts the third word (the version number).
    INSTALLED_VERSION=$(git --version | awk '{print $3}')
    
    echo "✅  Git is installed: version $INSTALLED_VERSION"

    # --------------------------------------------------------------
    # 🚀 Step 2: Compare Installed Version with Required Version
    # --------------------------------------------------------------
    # - If REQUIRED_VERSION is "latest", assume it's always valid.
    # - If installed version matches the required version, mark as matched.
    if [[ "$REQUIRED_VERSION" == "latest" || "$INSTALLED_VERSION" == "$REQUIRED_VERSION" ]]; then
      VERSION_MATCH=true
      echo "✅  Git version matches required version ($REQUIRED_VERSION)."
    else
      echo "⚠️  Git version mismatch (Installed: $INSTALLED_VERSION, Required: $REQUIRED_VERSION)."
    fi
  else
    # If Git is not found in the system PATH.
    echo "❌  Git is not installed."
  fi

  # --------------------------------------------------------------
  # 🚀 Step 3: Export Variables for External Use
  # --------------------------------------------------------------
  # These exported variables can be used by other scripts.
  export INSTALLED
  export VERSION_MATCH
  export INSTALLED_VERSION
}

# --------------------------------------------------------------
# 🛠️ Direct Execution Handling (Allows CLI Usage)
# --------------------------------------------------------------
# ✅ If executed directly (not sourced), run `git_check` function.
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  git_check "$1"
  echo "🔍 CLI Test Output:"
  echo "   - INSTALLED: $INSTALLED"
  echo "   - VERSION_MATCH: $VERSION_MATCH"
  echo "   - INSTALLED_VERSION: $INSTALLED_VERSION"
fi
