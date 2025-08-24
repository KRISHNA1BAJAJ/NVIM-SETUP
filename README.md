# 💤 Neovim Setup

This repository contains my custom **Neovim configuration** built on top of [NvChad](https://github.com/NvChad/NvChad) with additional tweaks for C++, Python, Java, Rust, and Lua development.

## 📂 Structure
- `init.lua` → main entrypoint for Neovim config
- `configs/` → lazy.nvim plugin configurations
- `plugins/` → extra plugins

## ⚡ Features

- **Plugin Manager** → [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Base Config** → NvChad v2.5
- **Relative Line Numbers** enabled
- **Keybindings**
  - `<F5>` → Compile & run C++ files (`g++ % -o %:r.exe && %:r.exe`)
  - `<S-r>` (Shift + r) → Save & run current Python file
- **LSP (Language Server Protocol) Support**
  - Pyright → Python
  - Clangd → C++
  - JDTLS → Java
  - Rust Analyzer → Rust
  - lua_ls → Lua (configured for Neovim dev)
- **Visual Tweaks**
  - Transparent background (`Normal` and `NonText` highlights cleared)

## 🚀 Setup

Clone the repo and set it up as your Neovim config:

```bash
git clone https://github.com/KRISHNA1BAJAJ/NVIM-SETUP.git ~/.config/nvim
