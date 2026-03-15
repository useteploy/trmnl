# trmnl Terminal IDE — Missing Features Analysis

**Research Date:** 2026-03-14
**Analysis Scope:** 20 feature categories across modern terminal development ecosystem

---

## 🔴 HIGH PRIORITY (Add Before v1.0 Release)

### 1. **Database Management** (Impact: HIGH | Effort: MEDIUM)
**Why:** Most devs work with databases daily
**Currently Missing:** Interactive database clients, schema explorers
**Recommended Tools:**
- [ ] **usql** - Universal SQL CLI supporting 80+ databases (easy to add)
- [ ] **lazysql / rainfrog** - TUI database UI for PostgreSQL/MySQL
- [ ] **Bytebase** - Collaborative migrations and governance

**Action:** `brew install usql` for basic SQL support, optional TUI layer later

---

### 2. **Secrets & Config Management** (Impact: HIGH | Effort: MEDIUM)
**Why:** Security-critical, often overlooked in dev environments
**Currently Missing:** Secrets management, config validation, injection tools
**Recommended Tools:**
- [ ] **Infisical CLI** - Secrets with environment sync and rotation
- [ ] **Doppler** - Cross-environment secrets management
- [ ] **Chamber** - AWS SSM integration for parameter management

**Action:** Add `.env` validation, consider Infisical integration

---

### 3. **API Development Tools** (Impact: MEDIUM | Effort: MEDIUM)
**Why:** REST/GraphQL development needs better tooling than curl
**Currently Missing:** GraphQL clients, API testing frameworks, gRPC support
**Recommended Tools:**
- [ ] **Bruno** - Open-source API client (.bru files, git-friendly)
- [ ] **Insomnia CLI** - GraphQL/REST testing with auth helpers
- [ ] **gqt** - Terminal GraphQL query builder

**Action:** Add as optional plugins, integrate with Neovim

---

### 4. **Container & DevOps** (Impact: HIGH | Effort: MEDIUM)
**Why:** Docker/K8s is essential for modern development
**Currently Missing:** Docker TUI, Kubernetes dashboard alternatives
**Recommended Tools:**
- [ ] **Lazydocker** - Full Docker/compose management in TUI
- [ ] **K9s** - Kubernetes dashboard alternative for terminal
- [ ] **Podman CLI** - Docker-compatible rootless containers

**Action:** Add Lazydocker to Formula, K9s optional

---

### 5. **Monitoring & Logging** (Impact: HIGH | Effort: HARD)
**Why:** Dev experience includes debugging production issues
**Currently Missing:** Log aggregation, metrics dashboards, error tracking
**Recommended Tools:**
- [ ] **SigNoz** - Open-source observability (logs/metrics/traces)
- [ ] **Grafana + Loki** - Log aggregation with dashboards
- [ ] **ELK CLI tools** - Elasticsearch/Logstash/Kibana CLI

**Action:** Add as "advanced" optional setup, not core

---

## 🟡 MEDIUM PRIORITY (Add in v1.1-v1.2)

### 6. **Refactoring & Code Generation** (Impact: MEDIUM | Effort: HARD)
**Why:** Automate large codebase changes and migrations
**Currently Missing:** Automated refactoring recipes, safe migrations
**Recommended Tools:**
- [ ] **OpenRewrite** - Automated code transformations
- [ ] **Moderne** - Enterprise refactoring platform
- [ ] **Zencoder** - AI-powered autonomous refactoring

**Action:** Research integration for popular frameworks

---

### 7. **Code Navigation & Architecture** (Impact: MEDIUM | Effort: HARD)
**Why:** Understand complex codebases visually
**Currently Missing:** Dependency graphs, architecture visualization
**Recommended Tools:**
- [ ] **Cosmo** - Terminal graph visualization
- [ ] **SCIP (Sourcegraph)** - Cross-repo navigation index
- [ ] **go-callvis** / **Python call graph tools** - Language-specific

**Action:** Add language-specific plugins incrementally

---

### 8. **Performance Profiling** (Impact: MEDIUM | Effort: HARD)
**Why:** Debugging performance issues is critical
**Currently Missing:** Profiling tools, flamegraph viewers, CPU/memory analysis
**Recommended Tools:**
- [ ] **bpftrace** - eBPF-based profiling (Linux)
- [ ] **FlameGraph** - Stack trace visualization
- [ ] **samply** - Easy-to-use profiling wrapper

**Action:** Add language-specific profilers as plugins

---

### 9. **Testing Enhancements** (Impact: MEDIUM | Effort: MEDIUM)
**Why:** Current test runner setup is basic
**Currently Missing:** Code coverage visualization, mutation testing, flaky test detection
**Recommended Tools:**
- [ ] **Stryker** - Mutation testing framework
- [ ] **Codecov** - Coverage tracking
- [ ] **pytest-watch** / **vitest** - Watch-mode testing

**Action:** Already have basic neotest; add coverage reporting

---

### 10. **Advanced Documentation** (Impact: MEDIUM | Effort: EASY)
**Why:** Developer experience includes inline help
**Currently Missing:** Context-aware docs, cheat sheets, LSP doc integration
**Recommended Tools:**
- [ ] **tldr** - Simplified man pages (already in Formula)
- [ ] **cheat.sh** - Community cheat sheets (already available)
- [ ] **Enhanced LSP hover** - Better documentation in editor

**Action:** Add tldr/cheat.sh to shell aliases

---

## 🟢 LOW PRIORITY (Nice-to-Have / v2.0+)

### 11. **Project & Build Management** (Impact: MEDIUM | Effort: MEDIUM)
**Why:** Complex projects need monorepo/build tooling
**Recommended Tools:**
- [ ] **Mise** - Rust-based tool versioning (replaces asdf/direnv)
- [ ] **Task** - YAML task runner with dependencies
- [ ] **Nx / Turborepo** - Monorepo build systems

**Action:** Optional integration for polyglot projects

---

### 12. **Productivity Tools** (Impact: LOW | Effort: MEDIUM)
**Why:** Out-of-scope for code-focused IDE
**Recommended Tools:**
- [ ] **Taskwarrior** - GTD task management
- [ ] **Obsidian CLI** - Note sync (if using Obsidian)

**Action:** Document integration guide, not core

---

### 13. **Terminal Enhancements** (Impact: LOW | Effort: EASY)
**Why:** Nice-to-have improvements
**Missing:**
- [ ] Starship right-side prompt improvements
- [ ] Custom shell functions and aliases
- [ ] Advanced zsh plugin integrations

**Action:** Expand .zshrc with more utilities

---

### 14. **File Manager Upgrades** (Impact: LOW | Effort: MEDIUM)
**Why:** Yazi already excellent; incremental improvements
**Recommended:**
- [ ] Yazi LSP integration
- [ ] Batch rename operations
- [ ] Improved previews

**Action:** Wait for upstream improvements

---

---

## 📊 Quick Decision Matrix

| Feature | Add Now? | Timeline | Effort |
|---------|----------|----------|--------|
| **usql** (SQL client) | YES | v1.0 | 30 min |
| **Lazydocker** | YES | v1.0 | 1 hour |
| **K9s** (Kubernetes) | OPTIONAL | v1.1 | 30 min |
| **Infisical** (Secrets) | YES | v1.0 | 2 hours |
| **Bruno** (API client) | NO | v1.1 | 2 hours |
| **Profiling tools** | NO | v1.2 | 4+ hours |
| **OpenRewrite** | NO | v1.2 | 4+ hours |
| **Mise** | OPTIONAL | v1.1 | 1 hour |

---

## 🚀 Recommended v1.0 → v1.1 Roadmap

### v1.0 (Current - Ready to Release)
- ✅ Core: Neovim, Zellij, Yazi, Lazygit
- ✅ LSPs: 60+ language servers
- ✅ AI: CodeCompanion + Claude API
- ✅ Debug: Python, Node, Go, Rust
- ✅ Test: Neotest with adapters
- ✅ Shell: Modern CLI tools (bat, eza, fzf, etc.)

### v1.1 (Next Sprint)
- [ ] Add `usql` for database support
- [ ] Add `Lazydocker` for container management
- [ ] Add Infisical CLI integration guide
- [ ] Enhanced secrets management docs
- [ ] `gh` CLI PR review extensions

### v1.2 (Following Sprint)
- [ ] Bruno API client integration
- [ ] K9s for Kubernetes
- [ ] Profiling tool plugins (language-specific)
- [ ] OpenRewrite integration research

### v2.0+ (Future)
- [ ] Monitoring/logging stack integration
- [ ] Advanced refactoring tools
- [ ] Multi-repo dependency visualization
- [ ] Enterprise DevOps features

---

## 🎯 What's NOT Missing (Already Excellent)

- ✅ **Terminal Multiplexing** — Zellij is modern & powerful
- ✅ **File Management** — Yazi is fast and feature-rich
- ✅ **Git Workflows** — Lazygit is comprehensive
- ✅ **Code Completion** — blink.cmp + LuaSnip is solid
- ✅ **Prompts** — Starship is modern and customizable
- ✅ **LSP** — 60+ servers cover all major languages
- ✅ **Terminal Tools** — bat, eza, fd, rg are best-in-class

---

## 🔗 Integration Opportunities

1. **MCP (Model Context Protocol)** - Universal AI tool integration
2. **LSP Extensions** - Extend language servers for databases/docs
3. **DAP Improvements** - More robust debugging for all languages

---

## Summary

**Ready to Release:** YES
**Critical Gaps:** None (v1.0 is complete)
**Recommended Additions:** SQL client (usql) + Docker TUI (Lazydocker)
**Timeline to v1.1:** 2-4 weeks
