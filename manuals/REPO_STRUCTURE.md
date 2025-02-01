# Repository Structure

This document provides a comprehensive overview of the directory structure for the `ts-boilerplate` repository. It outlines the purpose and organization of each directory and file, ensuring a clear understanding of where to find various components of the project.

## 🗂️ Table Of Contents

- [Repository Structure](#repository-structure)
  - [🗂️ Table Of Contents](#️-table-of-contents)
  - [Repository Layout](#repository-layout)

## Repository Layout

```bash
ts-boilerplate/
├── .devcontainer/                    # DevContainer setup
│   ├── devcontainer.json
│   ├── docker-compose.yml
│   ├── Dockerfile
│
├── .envs/                            # Environment variable examples
│   ├── .env.development.local.example
│   ├── .env.example
│   ├── .env.local.example
│   ├── .env.production.local.example
│   ├── .env.test.local.example
│
├── .git/                             # Git metadata
│   ├── hooks/                        # Git hooks
│   ├── info/                         # Git info
│   ├── logs/                         # Commit logs
│   ├── objects/                      # Git objects
│   ├── refs/                         # Branch references
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
│   │   ├── create-fr
│   │   ├── setup
│   ├── FR_BODY.md
│
├── .vcs/                             # Version Control System custom hooks
│   ├── hooks/
│   │   ├── pre-commit.sample
│
├── .vscode/                          # VS Code settings
│   ├── settings.json
│
├── configs/                          # VS Code settings
│   ├── docker-compose.yml            # Docker Compose file
│   ├── Dockerfile                    # Docker build file
│   ├── jest.config.js                # Jest configuration
│   ├── tsconfig.cjs.json             # CommonJS-specific TS config
│   ├── tsconfig.esm.json             # ESM-specific TS config
│   ├── tsconfig.json                 # TypeScript configuration
│
├── docs/                             # Generated Documentation Files
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
├── documents/                        # Additional documents
│   ├── README
│
├── manuals/                          # Project manuals
│   ├── CHANGELOG.md
│   ├── CONTRIBUTING.md
│   ├── REPO_STRUCTURE.md
│
├── policies/                         # Project policies
│   ├── CODE_OF_CONDUCT.md
│   ├── REMOTE_WORK_POLICY.md
│   ├── WORK_HOURS_POLICY.md
│
├── src/                              # Source code
│   ├── enums/                        # Enum definitions
│   │   ├── index.ts
│   ├── interfaces/                   # TypeScript interfaces
│   │   ├── index.ts
│   ├── models/                       # Data models
│   │   ├── index.ts
│   ├── index.ts                      # Main entry point
│
├── tests/                            # Unit tests
│   ├── enums/
│   │   ├── index.test.ts
│   ├── interfaces/
│   │   ├── index.test.ts
│   ├── models/
│   │   ├── index.test.ts
│   ├── index.test.ts
│
├── .dockerignore                     # Docker ignore files
├── .gitignore                        # Git ignore files
├── LICENSE                           # License file
├── package-lock.json                 # NPM lock file
├── package.json                      # NPM dependencies
├── README.md                         # Project README
```
