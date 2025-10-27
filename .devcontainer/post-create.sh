#!/bin/bash
set -e

echo "🚀 Starting post-create setup..."

# Verify GitHub CLI is installed
echo "✓ Checking GitHub CLI..."
if command -v gh &> /dev/null; then
    gh --version
else
    echo "❌ GitHub CLI not found!"
    exit 1
fi

# Install GitHub Copilot CLI extension
echo "📦 Installing GitHub Copilot CLI..."
if gh extension list | grep -q "github/gh-copilot"; then
    echo "✓ GitHub Copilot CLI already installed"
    gh extension upgrade gh-copilot || true
else
    gh extension install github/gh-copilot
fi

# Create copilot alias
echo "🔗 Creating copilot alias..."
if ! grep -q "alias copilot=" ~/.bashrc; then
    echo 'alias copilot="gh copilot"' >> ~/.bashrc
fi

# Verify copilot command
echo "✓ Verifying Copilot CLI..."
gh copilot --version || echo "⚠️  Copilot CLI installed, but may require authentication"

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
