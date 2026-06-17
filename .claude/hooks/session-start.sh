#!/bin/bash
set -euo pipefail

# Only run in remote Claude Code environments
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Install dependencies when manifests exist
if [ -f package.json ]; then
  npm install
fi

if [ -f requirements.txt ]; then
  pip install -r requirements.txt
fi

if [ -f pyproject.toml ]; then
  pip install -e ".[dev]" 2>/dev/null || pip install -e .
fi

if [ -f Cargo.toml ]; then
  cargo fetch
fi

if [ -f go.mod ]; then
  go mod download
fi

if [ -f Gemfile ]; then
  bundle install
fi
