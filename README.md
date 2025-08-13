# My Neovim Setup

This is my personal Neovim configuration, built for speed, minimal bloat, and modern development workflows.  
Tested on **Windows** with **NvChad** as the base config.

## Features
- **NvChad** for UI, theme, and sane defaults
- **Mason** for easy LSP, formatter, and debugger management
- **clangd** for C/C++ development
- **Lazy.nvim** for plugin management
- Keybindings optimized for quick compile/run cycles
- Support for multiple languages (C++, Python, JavaScript, HTML, CSS)

## Requirements
- Neovim (>= 0.9)
- Git
- Node.js & npm (for certain LSPs)
- Python 3 (with `pynvim`)
- C/C++ compiler (e.g., `gcc`, `clang`)

## Installation
```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone NvChad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

# Open Neovim to complete setup
nvim
