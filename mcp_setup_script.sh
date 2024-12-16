#!/bin/bash

# MCP Server Cross-Platform Setup Script
# Version 1.0
# Supports: Windows (Git Bash/WSL), macOS, Linux

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Logging function
log() {
    echo -e "${GREEN}[MCP SETUP]${NC} $1"
}

# Error handling function
error() {
    echo -e "${RED}[ERROR]${NC} $1"
    exit 1
}

# Warning function
warn() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Detect operating system
detect_os() {
    local OS=""
    local ARCH=""

    # Detect OS
    if [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macOS"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="linux"
    elif [[ "$OSTYPE" == "msys"* ]] || [[ "$OSTYPE" == "win"* ]]; then
        OS="windows"
    else
        error "Unsupported operating system: $OSTYPE"
    fi

    # Detect architecture
    ARCH=$(uname -m)

    echo "$OS:$ARCH"
}

# Check prerequisites
check_prerequisites() {
    log "Checking system prerequisites..."

    # Check Node.js
    if ! command -v node &> /dev/null; then
        error "Node.js is not installed. Please install Node.js (v16+ recommended)."
    fi
    log "Node.js $(node --version) is installed."

    # Check npm
    if ! command -v npm &> /dev/null; then
        error "npm is not installed. Please install npm."
    fi
    log "npm $(npm --version) is installed."

    # Check Git
    if ! command -v git &> /dev/null; then
        error "Git is not installed. Please install Git."
    fi
    log "Git $(git --version) is installed."
}

# Clone repository
clone_repository() {
    local REPO_URL="$1"
    local CLONE_DIR="$2"

    log "Cloning repository: $REPO_URL"
    
    # Check if directory exists
    if [ -d "$CLONE_DIR" ]; then
        warn "Directory $CLONE_DIR already exists. Pulling latest changes."
        cd "$CLONE_DIR" || error "Cannot change to directory $CLONE_DIR"
        git pull || error "Failed to pull latest changes"
        return 0
    fi

    # Clone repository
    git clone "$REPO_URL" "$CLONE_DIR" || error "Failed to clone repository"
    log "Repository cloned successfully to $CLONE_DIR"
}

# Install MCP server
install_mcp_server() {
    local PROJECT_DIR="$1"

    log "Installing MCP server..."
    cd "$PROJECT_DIR" || error "Cannot change to project directory"

    # Install project dependencies
    npm install || error "Failed to install project dependencies"

    # Install MCP create server
    npx @mcp/create-server || error "Failed to install MCP server"

    log "MCP server installed successfully"
}

# Configure environment
configure_environment() {
    local OS_INFO=$(detect_os)
    IFS=':' read -r OS ARCH <<< "$OS_INFO"

    log "Configuring environment for $OS ($ARCH)"

    # OS-specific configuration
    case "$OS" in
        "macOS")
            # Mac-specific configurations
            warn "Applying macOS-specific configurations"
            ;;
        "linux")
            # Linux-specific configurations
            warn "Applying Linux-specific configurations"
            ;;
        "windows")
            # Windows-specific configurations
            warn "Applying Windows-specific configurations"
            ;;
        *)
            error "Unsupported operating system"
            ;;
    esac
}

# Main setup function
main() {
    # GitHub repository configuration (replace with your actual repository)
    local REPO_URL="https://github.com/yourusername/your-mcp-project.git"
    local CLONE_DIR="$HOME/mcp-project"

    log "Starting MCP Server Setup"

    # Detect OS
    detect_os

    # Check prerequisites
    check_prerequisites

    # Clone repository
    clone_repository "$REPO_URL" "$CLONE_DIR"

    # Install MCP server
    install_mcp_server "$CLONE_DIR"

    # Configure environment
    configure_environment

    log "MCP Server setup completed successfully!"
}

# Run the main setup function
main

# Optional: Add any post-installation checks or startup commands
