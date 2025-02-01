# Project Structure

This document provides a comprehensive overview of the directory structure for the `nodejs-project-template` repository. It outlines the purpose and organization of each directory and file, ensuring a clear understanding of where to find various components of the project.

## Table of Contents

- [Project Structure](#project-structure)
  - [Table of Contents](#table-of-contents)
  - [./ Directory Layout](#-directory-layout)

## ./ Directory Layout

```bash
ts-boilerplate/
├── .devcontainer/                  # DevContainer setup
│   ├── devcontainer.json
│   ├── docker-compose.yml
│   ├── Dockerfile
│
├── .envs/                           # Environment variable examples
│   ├── .env.development.local.example
│   ├── .env.example
│   ├── .env.local.example
│   ├── .env.production.local.example
│   ├── .env.test.local.example
│
├── .git/                            # Git metadata
│   ├── hooks/                       # Git hooks
│   ├── info/                        # Git info
│   ├── logs/                        # Commit logs
│   ├── objects/                     # Git objects
│   ├── refs/                        # Branch references
│   ├── COMMIT_EDITMSG
│   ├── config
│   ├── description
│   ├── FETCH_HEAD
│   ├── HEAD
│   ├── index
│   ├── ORIG_HEAD
│   ├── packed-refs
│
├── .github/                         # GitHub metadata
│   ├── COMMIT_TEMPLATE/             # Commit message templates
│   │   ├── commit.txt
│   ├── ISSUE_TEMPLATE/              # Issue templates
│   │   ├── bug_report.md
│   │   ├── feature_request.md
│   ├── PULL_REQUEST_TEMPLATE/       # PR template
│   │   ├── pull_request.md
│   ├── workflows/                   # GitHub Actions workflows
│   ├── gh/                          # GitHub CLI scripts
│   │   ├── setup
│   ├── scripts/                      # Additional scripts
│   │   ├── create-fr
│   ├── fr-body.md
│
├── .vcs/                            # Version Control System custom hooks
│   ├── hooks/
│   │   ├── pre-commit.sample
│
├── .vscode/                         # VS Code settings
│   ├── settings.json
│
├── docs/                            # Documentation
│   ├── .nojekyll
│   ├── index.html
│   ├── modules.html
│   ├── assets/
│   │   ├── highlight.css
│   │   ├── icons.js, icons.svg
│   │   ├── main.js, navigation.js, search.js, style.css
│   ├── media/
│   │   ├── CONTRIBUTING.md
│
├── documents/                       # Additional documents
│   ├── README
│
├── manuals/                         # Project manuals
│   ├── CHANGELOG.md
│   ├── CONTRIBUTING.md
│   ├── PROJECT_STRUCTURE.md
│
├── src/                             # Source code
│   ├── enums/                       # Enum definitions
│   │   ├── index.ts
│   ├── interfaces/                   # TypeScript interfaces
│   │   ├── index.ts
│   ├── models/                        # Data models
│   │   ├── index.ts
│   ├── index.ts                      # Main entry point
│
├── tests/                           # Unit tests
│   ├── enums/
│   │   ├── index.test.ts
│   ├── interfaces/
│   │   ├── index.test.ts
│   ├── models/
│   │   ├── index.test.ts
│   ├── index.test.ts
│
├── .gitignore                        # Ignore files
├── jest.config.js                    # Jest configuration
├── LICENSE                           # License file
├── package.json                      # NPM dependencies
├── package-lock.json                  # NPM lock file
├── README.md                          # Project README
├── tsconfig.json                      # TypeScript configuration
├── tsconfig.cjs.json                   # CommonJS-specific TS config
├── tsconfig.esm.json                   # ESM-specific TS config
```
