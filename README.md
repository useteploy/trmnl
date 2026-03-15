# trmnl — Terminal IDE

**The Ultimate Terminal Development Environment**

A fully-featured terminal IDE with Neovim, Zellij, AI, debugging, testing, databases, containers, APIs, and 50+ integrated tools.

## Install

### macOS & Linux

```bash
brew install yourusername/trmnl/trmnl
trmnl
source ~/.zshrc
```

### Windows (via WSL)

```powershell
# Enable WSL
wsl --install

# Inside WSL:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
source ~/.bashrc

brew install yourusername/trmnl/trmnl
trmnl
```

## What's Included

### 🧠 Core IDE (Neovim-based)
- **Neovim 0.11+** with 60+ language servers
- **Zellij** modern multiplexer with layouts
- **Harpoon** for quick file/terminal jumping
- **CodeCompanion** AI code assistance (Claude API)
- **Neotest** integrated test runner
- **nvim-dap** debugging (Python, Node, Go, Rust)
- **blink.cmp** intelligent autocomplete

### 🔴 Tier 1: Essential Development Tools
- **usql** — SQL client (PostgreSQL, MySQL, MongoDB, 80+ databases)
- **Docker + docker-compose** — Container orchestration
- **Lazydocker** — Docker/Podman management UI
- **Podman** — Rootless containers (optional)
- **K9s** — Kubernetes dashboard
- **gh-dash** — GitHub PR/issue dashboard
- **Bruno** — API/GraphQL testing
- **Infisical** — Secrets management
- **Mise** — Tool versioning + task automation

### 🟡 Tier 2: Profiling & Productivity
- **py-spy** — Python CPU profiling
- **0x** — Node.js profiling
- **go-callvis** — Go call graph visualization
- **Broot** — Tree-based filesystem navigation
- **task** — YAML task runner
- **Taskwarrior** — GTD task management

### 🟠 Tier 3-5: Advanced Tools
- **wrk** — HTTP load testing & benchmarking
- **Poetry** — Python dependency management
- **pnpm** — Fast Node.js package manager
- **Atuin** — Smart shell history
- **ripgrep-all** — Search PDFs, docs, archives
- **HTTPie** — Better curl alternative
- **rsync** — File synchronization
- **direnv** — Environment management
- **tmux** — Fallback multiplexer

### 🎨 Universal Features
- **Modern CLI tools** — bat, eza, delta, starship, fzf, zoxide, ripgrep, fd
- **Tokyo Night theme** — cohesive across all tools
- **Auto-configuration** — Detects WezTerm, auto-disables conflicts
- **Pre-built layouts** — Optimized for development workflows
- **Shell integration** — Rich aliases and functions
- **Git integration** — Lazygit + Delta diffs

## Quick Start

```bash
trmnl              # Launch Terminal IDE
trmnl keys         # Show keybind cheatsheet
trmnl doctor       # Check installation
trmnl setup        # Manual setup
trmnl uninstall    # Remove configs
```

## Keybinds

### Zellij (Pane/Tab Management)
- `Ctrl+p` — Pane mode
  - `a` new left | `r` new right | `d` new down | `b` new bottom
  - `h/j/k/l` move focus | `f` fullscreen | `x` close pane
- `Ctrl+t` — Tab mode
  - `n` new | `x` close | `r` rename | `1-9` jump
- `Ctrl+n` — Resize mode (h/j/k/l)
- `Ctrl+s` — Scroll mode (j/k/u/d for navigation)

### Neovim (Editor)
- `<leader>sf` — Find files
- `<leader>sg` — Grep search
- `<leader>sh` — Search help
- `<leader>ai` — AI instructions (CodeCompanion)
- `<leader>ac` — AI chat
- `<leader>ha` — Harpoon add file
- `<leader>hm` — Harpoon menu
- `<leader>h1-5` — Jump to harpoon file
- `<leader>tr` — Run tests
- `<leader>tn` — Run nearest test
- `F5` — Debug start/continue
- `F1/F2/F3` — Debug step into/over/out
- `<leader>b` — Toggle breakpoint

### Shell Aliases
```bash
# Navigation
neo          # Open Neo-tree
ya           # Open Yazi
lg           # Launch Lazygit
br           # Launch Broot

# Development
sql          # Connect to database
lzd          # Docker management
k9s          # Kubernetes dashboard
api          # API testing (Bruno)
tm           # Run tasks (Mise)
tasks        # List tasks (Taskwarrior)
pyprofile    # Python profiling
gocalls      # Go call graph

# System
monitor      # System monitor (btop)
http         # Make HTTP requests (HTTPie)
sync         # File sync (rsync)
```

## Configuration

All configuration is in `~/.config/`:
- `nvim/init.lua` — Neovim
- `zellij/config.kdl` — Zellij
- `yazi/` — File manager
- `starship.toml` — Prompt
- `.gitconfig` — Git + Delta
- `.zshrc` — Shell config

See `CONFIG_GUIDE_COMPLETE.md` for detailed setup of each tool.

## Requirements

- **macOS / Linux:** Homebrew
- **Windows:** WSL + Ubuntu + Homebrew
- **Optional:** ANTHROPIC_API_KEY for Claude Code integration

## Optional Enhancements

Not included by default, but easy to add:
- **Terraform** — Infrastructure as Code
- **Ansible** — Configuration management
- **Helm** — Kubernetes package manager
- **Nushell** — Modern shell alternative

See `CONFIG_GUIDE_COMPLETE.md` for setup instructions.

## What Makes This Different

✅ **Complete** — 50+ integrated tools, not just an editor
✅ **Batteries Included** — No config needed, just `brew install`
✅ **Modern** — Rust/Go CLI tools, 2026 ecosystem
✅ **Focused** — Carefully curated, not bloatware
✅ **Documented** — Comprehensive guides for every tool
✅ **Themeable** — Tokyo Night across all tools
✅ **Extensible** — Easy to add more tools

## Comparison

| Feature | trmnl | VS Code | JetBrains |
|---------|-------|---------|-----------|
| Runs in terminal | ✅ | ❌ | ❌ |
| No UI bloat | ✅ | ❌ | ❌ |
| Free & open source | ✅ | ❌ (mostly) | ❌ |
| AI assistance | ✅ Claude | ✅ Copilot | ✅ AI |
| Databases | ✅ | ❌ | ✅ |
| Containers | ✅ | ❌ | ✅ |
| Kubernetes | ✅ | ❌ | ❌ |
| API testing | ✅ | ❌ | ❌ |
| Lightweight | ✅ | ❌ | ❌ |

## Next Steps

1. **First run:** `trmnl setup`
2. **Configure API key:** `export ANTHROPIC_API_KEY=sk-ant-...`
3. **Explore keybinds:** `trmnl keys`
4. **Read docs:** See `CONFIG_GUIDE_COMPLETE.md`
5. **Customize:** Edit `~/.config/nvim/init.lua`, `~/.zshrc`, etc.

## Troubleshooting

```bash
# Check everything is installed
trmnl doctor

# Reinstall configs
trmnl setup

# See keybinds
trmnl keys

# Manual language server install
:Mason
```

## Contributing

Issues and PRs welcome! See GitHub repository.

## License

MIT

---

**Made for developers who embrace the terminal.**

Version 1.0.0 — "Everything Edition"
