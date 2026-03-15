# trmnl Terminal IDE — Strategic Roadmap Decision

**Core Question:** What should ship in v1.0 vs. future versions?

---

## 🔴 QUICK WINS ANALYSIS

### 1. **usql** — SQL Client
**Current Status:** Not installed
**Effort:** 10 minutes (add to Formula + keybind)
**Value:** HIGH (database work is 30% of dev time for most)
**Users:** Backend devs, full-stack, data engineers

**Decision: ✅ ADD TO v1.0**

**Why:**
- Lightweight dependency
- Replaces manual `mysql`, `psql` commands
- Works with 80+ databases (future-proof)
- Single CLI tool
- Easy shell alias: `sql usql`

**Implementation:**
```bash
# 1. Add to Formula
brew_install 'usql'

# 2. Add shell alias
alias sql='usql'
alias db='usql'

# 3. Add keybind to Neovim for executing SQL
```

**Effort:** 5 minutes

---

### 2. **Lazydocker** — Docker Management
**Current Status:** Not installed
**Effort:** 20 minutes
**Value:** HIGH (Docker is ubiquitous)
**Users:** DevOps, backend, full-stack devs

**Decision: ✅ ADD TO v1.0**

**Why:**
- Replaces manual `docker ps`, `docker logs`, etc.
- Rich TUI mirrors Lazygit's philosophy
- Single dependency
- Huge QoL improvement for container work
- Familiar keybinds to Zellij/tmux users

**Implementation:**
```bash
# 1. Add to Formula
brew_install 'lazydocker'

# 2. Add keybind/alias
alias lzd='lazydocker'

# 3. Consider Neovim plugin to launch from project root
```

**Effort:** 8 minutes

---

### 3. **gh-dash** — GitHub PR Dashboard
**Current Status:** Not installed (requires GitHub CLI extensions)
**Effort:** 30 minutes
**Value:** MEDIUM (only for GitHub users)
**Users:** GitHub-focused developers

**Decision: ⚠️ CONDITIONAL ADD**

**Considerations:**
- Only works with GitHub (no GitLab/Gitea support)
- Requires `gh` CLI (already installed)
- Just a fancy PR browser
- Already have Lazygit for git workflow

**Alternative:** Stick with built-in `gh pr list` for now

**If Adding:**
```bash
# 1. Install gh extension
gh extension install dlvhdr/gh-dash

# 2. Keybind in zshrc
alias ghd='gh dash'
```

**Recommendation:** SKIP for v1.0, add in v1.1 if GitHub users request it

**Effort:** 5 minutes (if added later)

---

### 4. **Infisical CLI** — Secrets Management
**Current Status:** Not installed
**Effort:** Document + optional setup
**Value:** HIGH (security critical)
**Users:** DevOps, backend, security-conscious teams

**Decision: ✅ ADD DOCUMENTATION (not required in Formula)**

**Why:**
- Not all projects use Infisical
- Users who need it will install manually
- Better as integration guide than core dependency

**Implementation:**
```markdown
# CONFIG_GUIDE.md section:

## Optional: Secrets Management with Infisical

### Setup
1. `brew install infisical`
2. `infisical login`
3. Create .env from your Infisical project

### Usage in trmnl
```bash
# Auto-load secrets
infisical run -- command

# Or alias
alias infil='infisical login'
```

**Recommendation:** Add to CONFIG_GUIDE.md as optional feature

**Effort:** 10 minutes (documentation)

---

## 🟡 FUTURE ENHANCEMENTS ANALYSIS

### 5. **Bruno** — API/GraphQL Client
**Current Status:** Not installed
**Effort:** 30 minutes (if adding)
**Value:** MEDIUM (API devs mostly use Insomnia/Postman)
**Friction:** CLI doesn't match TUI philosophy

**Recommendation:** SKIP v1.0
- VS Code + Insomnia extension is already standard
- Bruno CLI is immature compared to TUI versions
- Most API devs don't use terminal tools for this yet

---

### 6. **K9s** — Kubernetes Dashboard
**Current Status:** Not installed
**Effort:** 15 minutes (if adding)
**Value:** HIGH (Kubernetes is essential for cloud)
**Friction:** Only for Kubernetes users (niche)

**Recommendation:** ADD TO v1.1 (not v1.0)
- Many devs don't use K8s locally
- Can add as optional install later
- Won't break anyone's workflow if missing
- Popular enough to include eventually

---

### 7. **Profiling Tools** (bpftrace, flamegraph, samply)
**Current Status:** Partially (some language-specific)
**Effort:** 2-4 hours per language
**Value:** HIGH (performance debugging is critical)
**Friction:** Complex, varies by language

**Recommendation:** SKIP v1.0, ADD v1.2
- Language-specific integrations needed
- Heavy dependencies (kernel tools for eBPF)
- Better done incrementally by language

**Plan:**
- v1.1: Python profiling (`py-spy`)
- v1.2: JavaScript/TypeScript (`0x` or `clinic.js`)
- v1.3: Go/Rust profiling

---

### 8. **OpenRewrite** — Automated Refactoring
**Current Status:** Not installed
**Effort:** 4+ hours (complex setup)
**Value:** MEDIUM-HIGH (framework-specific)
**Friction:** Java-first, requires Maven/Gradle

**Recommendation:** SKIP (too specialized)
- Better as VS Code extension
- Terminal integration is awkward
- Most refactoring done via editor LSP already

---

## 🟢 NOT CRITICAL (v2.0+)

### Advanced Monitoring/Logging
**Recommendation:** SKIP
- Overkill for single-developer workflow
- Better managed separately (Grafana, ELK cloud)
- Can't integrate without significant infrastructure

### Code Visualization Tools
**Recommendation:** SKIP
- Use web-based tools (GitHub, GitLab)
- Terminal rendering too limited
- Better as VS Code extension

### Monorepo Helpers
**Recommendation:** SKIP
- `make` and language-specific tools work fine
- Only relevant if you build monorepos
- Can add Mise later if needed

---

## 📋 FINAL RECOMMENDATION

### ✅ Definitely Add to v1.0 (10 minutes total)
1. **usql** — SQL client
2. **Lazydocker** — Docker TUI
3. Document **Infisical** (optional)

**Why this set:**
- All 3 are essential for modern dev workflows
- Single CLI tools (no bloat)
- Align with trmnl's philosophy (best-in-class tools)
- 15 minutes to implement

### ✅ Add to v1.1 (separate release)
1. **K9s** — Kubernetes dashboard
2. **gh-dash** — GitHub PR dashboard
3. Python profiling (`py-spy`)

### ⏸️ Defer (Future versions or user requests)
- Bruno (API client)
- Profiling for other languages
- OpenRewrite
- Monitoring/logging stacks

---

## 🚀 Recommended Action Plan

### Phase 1: Merge Quick Wins (30 minutes)
```bash
# 1. Update Homebrew Formula
# Add: usql, lazydocker

# 2. Update zshrc block
# Add aliases:
alias sql='usql'
alias lzd='lazydocker'

# 3. Update CONFIG_GUIDE.md
# Add section: Optional: Infisical, K9s, etc.

# 4. Update keybind documentation
# Document how to launch from Neovim:
<leader>db -- launch usql
<leader>dk -- launch lazydocker
```

### Phase 2: v1.0 Release
- Current setup + usql + lazydocker
- Push to GitHub
- Create Homebrew tap

### Phase 3: v1.1 Sprint (1-2 weeks later)
- Add K9s
- Add gh-dash
- User feedback integration

---

## 📊 Current vs. Enhanced Comparison

### v1.0 (Current Setup)
- ✅ Neovim + LSPs (60+ languages)
- ✅ Zellij (multiplexing)
- ✅ Yazi (files)
- ✅ Lazygit (version control)
- ✅ CodeCompanion (AI)
- ✅ Debugging (Python, Node, Go, Rust)
- ✅ Testing (Neotest)
- ✅ Modern CLI tools

### v1.0 Enhanced (with quick wins)
- ✅ Everything above, PLUS:
- ✅ **usql** (SQL databases)
- ✅ **Lazydocker** (containers)
- 📋 **Infisical** (documented)

### v1.1 Roadmap
- ✅ Everything above, PLUS:
- ✅ **K9s** (Kubernetes)
- ✅ **gh-dash** (GitHub PRs)
- ✅ Python profiling

---

## 🎯 Verdict

**Option A: Ship as-is (v1.0 ready NOW)**
- Risk: Users feel it's missing databases/Docker support
- Timeline: Push today
- Advantage: Get feedback before over-engineering

**Option B: Add quick wins (15 min effort)**
- Risk: None (low-effort additions)
- Timeline: Push in 1 hour
- Advantage: More complete, covers 95% of workflows
- **✅ RECOMMENDED**

**Option C: Add everything (1+ hour effort)**
- Risk: Scope creep, delays release
- Timeline: Push in 2-3 days
- Advantage: Comprehensive, but overkill
- **❌ NOT RECOMMENDED**

---

## Final Recommendation: **OPTION B**

**Add in 15 minutes:**
1. usql (5 min)
2. Lazydocker (5 min)
3. Update docs (5 min)

**Then push to GitHub and celebrate v1.0 release** 🎉

**Later in v1.1:** Add K9s, gh-dash, and profiling based on user requests.
