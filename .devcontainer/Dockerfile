# Copyright (c) 2025 Astitv Singh <https://github.com/astitvsingh>.
# SPDX-License-Identifier: MIT

# ------------------------------------------------------------------------------ 
# Dockerfile for a Consistent Ubuntu 24.10 Development Environment
# Base OS: Ubuntu 24.10
# Purpose: Provides an updated, pre-configured development environment with essential tools.
# Author: Astitv Singh <https://github.com/astitvsingh>
# Version: 0.1.0-alpha
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------ 
# Base Image Setup
# Define the base image as Ubuntu 24.10 for compatibility and consistency.
# ------------------------------------------------------------------------------ 
FROM ubuntu:24.10

# -------------------------------------------------------------------------------
# Metadata Labels
# Add descriptive metadata to the Docker image for improved traceability.
# -------------------------------------------------------------------------------
LABEL org.opencontainers.image.title="The Platform DevContainer" \
org.opencontainers.image.description="Nodejs Typescript development environment with pre-installed tools for efficient software development." \
org.opencontainers.image.authors=["Astitv Singh <https://github.com/astitvsingh>"] \
org.opencontainers.image.vendor="The Platform Project" \
org.opencontainers.image.version="0.1.0-alpha" \
org.opencontainers.image.licenses="MIT" \
org.opencontainers.image.source="https://github.com/astitvsingh/the_platform" \
org.opencontainers.image.documentation="https://github.com/astitvsingh/the_platform/wiki" \
org.opencontainers.image.revision="abc12345" \
org.opencontainers.image.created="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
org.opencontainers.image.base.name="ubuntu:24.10" \
org.label-schema.schema-version="1.0" \
org.label-schema.build-date="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
org.label-schema.vcs-url="https://github.com/astitvsingh/the_platform" \
org.label-schema.vcs-ref="abc12345"

# ------------------------------------------------------------------------------ 
# Environment Configuration
# Set the `DEBIAN_FRONTEND` variable to non-interactive mode.
# This prevents `apt-get` from prompting for user input during package installations,
# ensuring compatibility in automated Docker environments.
# ------------------------------------------------------------------------------ 
ENV DEBIAN_FRONTEND=noninteractive

# ------------------------------------------------------------------------------ 
# System Update and Upgrade
# Refresh the package manager cache and upgrade all installed packages
# to their latest stable versions, ensuring a secure and reliable base system.
# ------------------------------------------------------------------------------ 
RUN apt-get update \
&& apt-get upgrade -y

# ------------------------------------------------------------------------------
# System Update and Essential Tools Installation
# ------------------------------------------------------------------------------

# Step 3: Install Essential Package Management Tools:
# - Installs `apt` to ensure the availability of the package manager.
RUN apt-get install -y apt

# Step 3.1: Install Security Tools:
# - `gpg`: Provides cryptographic signing and encryption.
# - `ufw`: Firewall management tool to configure access control rules.
# - `fail2ban`: Protects against brute-force attacks by banning IPs after multiple failed login attempts.
RUN apt-get install -y gpg \
ufw \
fail2ban

# Step 4: Install Essential System Tools:
# - `sudo`: Enables execution of commands with elevated privileges.
# - `curl`: A command-line tool for transferring data using various protocols.
# - `wget`: A command-line utility for downloading files from the web.
# - `nano`: A lightweight text editor for simple file editing.
RUN apt-get install -y sudo \
curl \
wget \
nano

# Step 5: Install Debugging and Monitoring Tools:
# - `htop`: An interactive process viewer to monitor system resources.
# - `strace`: Tracks system calls made by processes for debugging.
# - `lsof`: Lists open files and network connections for troubleshooting.
RUN apt-get install -y htop \
strace \
lsof

# Step 6: Install Networking and SSH Tools:
# - `net-tools`: Provides networking utilities (e.g., `ifconfig`, `netstat`).
# - `iputils-ping`: Allows testing network connectivity.
# - `dnsutils`: Includes DNS tools like `dig` for troubleshooting.
# - `openssh-client`: Securely connects to remote systems via SSH.
RUN apt-get install -y net-tools \
iputils-ping \
dnsutils \
openssh-client

# Step 7: Install Essential Build Tools:
# - `build-essential`: Installs GCC, G++, and related build tools.
# - `cmake`: A cross-platform build system for compiling software.
# - `make`: A tool to automate the build process.
# - `libssl-dev`: Development files for SSL/TLS protocols.
# - `libcurl4-gnutls-dev`: Development files for libcurl.
# - `libexpat1-dev`: Development files for XML parsing.
# - `gettext`: Provides utilities for internationalization and localization.
# - `jq`: Provides utilities for JSON.
RUN apt-get install -y build-essential \
cmake \
make \
libssl-dev \
libcurl4-gnutls-dev \
libexpat1-dev \
gettext \
jq

# Install Git from Source
# - Downloads and builds Git version 2.47.1 from source for a controlled installation.
# - Cleans up unnecessary files after installation to save space.
RUN curl -o git.tar.gz -L https://github.com/git/git/archive/refs/tags/v2.47.1.tar.gz \
&& tar -xvf git.tar.gz \
&& cd git-2.47.1 \
&& make prefix=/usr/local all \
&& sudo make prefix=/usr/local install \
&& cd .. \
&& rm -rf git-2.47.1 git.tar.gz

# Install Git-Flow
RUN apt-get install -y git-flow

# Install Essential CI/CD Tools
# - `gh`: The GitHub CLI for managing repositories and workflows.
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& apt-get install -y gh

# - `jenkins-cli`: Jenkins CLI for interacting with Jenkins servers.
RUN curl -LO http://mirrors.jenkins.io/war-stable/latest/jenkins.war \
&& mv jenkins.war /usr/share/jenkins-cli.war

# Step 10: Install Language Runtimes:
# - Installs Node.js, npm, and globally required npm packages.
# - `Node.js`: JavaScript runtime environment.
# - `npm`: Node.js package manager for managing dependencies.
# - `cross-spawn`: Enhanced cross-platform child process spawning.
# - `TypeScript`: Adds support for typed JavaScript.
# - `jest`: JavaScript testing framework for Node.js and TypeScript.
RUN curl -sL https://deb.nodesource.com/setup_22.x | sudo -E bash - \
&& apt-get install -y nodejs \
&& npm install -g npm@11.0.0 \
&& npm install -g cross-spawn@7.0.5 \
&& npm install -g typescript \
&& npm install -g jest

# Clean Up:
# - Removes cached package files to reduce the image size.
RUN apt-get clean \
# Final Clean Up
# - Removes temporary package index files to minimize the image size further.
&& rm -rf /var/lib/apt/lists/*

# ------------------------------------------------------------------------------
# User Configuration
# Create a non-root user `developer` with passwordless sudo access for ease of use.
# ------------------------------------------------------------------------------

# Create a new user `developer`
# - Home directory: `/home/developer`.
# - Default shell: `/bin/bash`.
RUN useradd -m -s /bin/bash developer \
# Add `developer` to the `sudo` group.
# Grants administrative privileges to the user.
&& usermod -aG sudo developer \
# Ensure `/etc/sudoers.d/` directory exists.
# Used for storing user-specific sudo configurations.
&& mkdir -p /etc/sudoers.d \
# Create a passwordless sudo configuration for `developer`.
# Allows the user to execute sudo commands without a password prompt.
&& echo "developer ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/developer \
# Secure the sudoers file.
# Sets file permissions to `0440` to restrict access to the system.
&& chmod 0440 /etc/sudoers.d/developer

# ------------------------------------------------------------------------------
# Set Default User
# Switch to the `developer` user for all subsequent commands.
# ------------------------------------------------------------------------------

USER developer
