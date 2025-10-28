#!/bin/bash
set -e

echo "🚀 Starting post-create setup..."

# Install Git LFS if not present
echo "📦 Checking Git LFS..."
if ! command -v git-lfs &> /dev/null; then
    echo "Installing Git LFS..."
    sudo apt-get update -qq && sudo apt-get install -y git-lfs
    git lfs install
    echo "✓ Git LFS installed"
else
    echo "✓ Git LFS already installed"
fi

# Verify GitHub CLI is installed
echo "✓ Checking GitHub CLI..."
if command -v gh &> /dev/null; then
    gh --version
else
    echo "❌ GitHub CLI not found!"
    exit 1
fi

# Install GitHub Copilot CLI (npm package)
echo "📦 Installing GitHub Copilot CLI..."
if command -v copilot &> /dev/null; then
    echo "✓ GitHub Copilot CLI already installed"
    npm update -g @github/copilot || true
else
    npm install -g @github/copilot
fi

# Verify copilot command
echo "✓ Verifying Copilot CLI..."
copilot --version || echo "⚠️  Copilot CLI installed, but may require authentication"

# Install npm dependencies if package.json exists
if [ -f "package.json" ]; then
    echo "📦 Installing npm dependencies..."
    npm install
    echo "✓ Dependencies installed successfully"
else
    echo "ℹ️  No package.json found, skipping npm install"
fi

echo ""
echo "✅ Post-create setup completed!"
echo ""
echo "📝 Available commands:"
echo "  - gh --version          : Check GitHub CLI version"
echo "  - gh copilot --help     : Use GitHub Copilot CLI"
echo "  - copilot --help        : Use GitHub Copilot CLI (alias)"
echo ""
echo "🎉 Your development environment is ready!"
