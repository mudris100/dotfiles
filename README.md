# Dotfiles

A collection of configuration files and setup scripts for Linux environments, optimized for both server and workstation use.

## 📁 Structure

- **`alacritty/`**: Terminal emulator configuration with multiple color themes.
- **`bashrc.d/`**: Modular Bash configuration including [aliases](bashrc.d/aliases) and [functions](bashrc.d/functions).
- **`tmux/`**: Terminal multiplexer configurations for [servers](tmux/tmux-server.conf) and [workstations](tmux/tmux-workstation.conf).
- **`vim/`**: Comprehensive [vimrc](vim/vimrc) with language-specific indentation, key mappings, and various color schemes.
- **`setup-server.sh`**: Automated setup script for server environments.
- **`setup-workstation.sh`**: Automated setup script for workstation environments.

## 🚀 Getting Started

### Prerequisites

Ensure you have the following tools installed:
- `bash`
- `vim`
- `tmux`
- `git`
- `alacritty` (for workstation setup)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/mudris100/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. Run the appropriate setup script:
   - For a **Server**:
     ```bash
     ./setup-server.sh
     ```
   - For a **Workstation**:
     ```bash
     ./setup-workstation.sh
     ```

## 🛠️ Features

### Vim
- **Leader Key**: Set to `Space`.
- **File Explorer**: Integrated `netrw` toggled with `F2`.
- **Navigation**: Easy split navigation using `Space + h/j/k/l` or `Space + Arrows`.
- **Indentation**: Smart defaults with language-specific overrides (2-space for YAML/JSON/HTML, 4-space for Python/Bash).

### Bash
- **Aliases**: Productive shortcuts like `gs` for `git status`, `..` for navigation, and `ports` for listening sockets.
- **Functions**: Includes utilities for checking external IP, color testing, and an enhanced `cd` that automatically lists directory contents.
- **Prompt**: Custom colorized prompt with host and path information.

### Tmux
- **Vi Mode**: Enabled for buffer navigation.
- **Mouse Support**: Enabled for resizing and selection.
- **Theme**: Tokyo Night inspired status bar.

### Alacritty
- Includes a wide variety of themes (Tokyo Night, Nord, One Dark, Gruvbox, etc.) located in the `alacritty/themes/` directory.

## 🎨 Themes

The project includes several popular color schemes for Vim and Alacritty, allowing for a consistent visual experience across different environments.
