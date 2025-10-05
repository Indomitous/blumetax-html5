#!/bin/bash

# Quick Start Script for Blume Tax & Consulting Azure Static Web Apps
# This script helps you get started with local development

set -e

echo "🚀 Blume Tax & Consulting - Azure Static Web Apps Setup"
echo "========================================================"
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 18+ first."
    echo "   Download from: https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js $(node -v) detected"

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

echo "✅ npm $(npm -v) detected"
echo ""

# Install dependencies if needed
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
    echo "✅ Dependencies installed"
else
    echo "✅ Dependencies already installed"
fi

echo ""
echo "🎯 Quick Start Commands:"
echo "------------------------"
echo "  npm start       - Start development server"
echo "  npm run dev     - Start development server (alias)"
echo "  npm run deploy  - Deploy to Azure (requires authentication)"
echo ""
echo "📚 Documentation:"
echo "----------------"
echo "  README.md       - Project overview"
echo "  DEVELOPMENT.md  - Local development guide"
echo "  DEPLOYMENT.md   - Azure deployment guide"
echo ""

# Ask if user wants to start the server
read -p "Would you like to start the development server now? (y/n) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo ""
    echo "🌐 Starting Azure Static Web Apps CLI..."
    echo "   The site will be available at: http://localhost:4280"
    echo "   Press Ctrl+C to stop the server"
    echo ""
    npm start
else
    echo ""
    echo "👍 Great! Run 'npm start' when you're ready to begin development."
    echo ""
fi
