# VSCode Replacement Guide - Complete Setup

Your Neovim is now configured to fully replace VSCode for TypeScript development!

## What Was Added

### 1. LSP & Completion ([lsp.lua](lua/plugins/lsp.lua), [cmp.lua](lua/plugins/cmp.lua))
**Replaces:** VSCode IntelliSense, code completion, error checking

**Features:**
- Auto-completion with `Tab`/`Shift-Tab`
- Go to definition: `gd`
- Show references: `gr`
- Hover documentation: `K`
- Code actions: `<Space>ca`
- Rename symbol: `<Space>rn`
- Next/previous diagnostic: `]d` / `[d`

**Installed Language Servers:**
- TypeScript/JavaScript (ts_ls)
- ESLint
- Lua (lua_ls)
- Python (pyright)

### 2. Auto-Formatting ([conform.lua](lua/plugins/conform.lua))
**Replaces:** VSCode format on save, Prettier extension

**Features:**
- Auto-format on save (enabled for TS, JS, JSON, etc.)
- Manual format: `<Space>f`
- Uses Prettier for TypeScript/JavaScript

**First Time Setup:**
```bash
# Install formatters (do this once)
npm install -g prettier  # For TypeScript/JavaScript
pip install black        # For Python (optional)
cargo install stylua     # For Lua (optional)
```

### 3. Git Integration ([gitsigns.lua](lua/plugins/gitsigns.lua), [lazygit.lua](lua/plugins/lazygit.lua))
**Replaces:** VSCode Git sidebar, GitLens

**Features:**
- Git changes in gutter (added/modified/deleted lines)
- Next/previous hunk: `]c` / `[c`
- Stage hunk: `<Space>hs`
- Preview hunk: `<Space>hp`
- Blame line: `<Space>hb`
- Full Git UI: `<Space>gg` (opens LazyGit)

**First Time Setup:**
```bash
# Install lazygit (do this once)
# On Debian/Ubuntu:
sudo apt install lazygit

# Or with go:
go install github.com/jesseduffield/lazygit@latest
```

### 4. File Explorer ([neo-tree.lua](lua/plugins/neo-tree.lua))
**Replaces:** VSCode file explorer sidebar

**Features:**
- Toggle explorer: `<Space>e`
- Focus explorer: `<Space>o`
- Create file: `a`
- Delete file: `d`
- Rename file: `r`
- Copy/paste: `c` / `p`

### 5. Diagnostics Panel ([trouble.lua](lua/plugins/trouble.lua))
**Replaces:** VSCode Problems panel

**Features:**
- Toggle diagnostics: `<Space>xx`
- Buffer diagnostics: `<Space>xX`
- Location list: `<Space>xL`

### 6. Additional Features

**Auto-close brackets** ([autopairs.lua](lua/plugins/autopairs.lua))
- Automatically closes `()`, `{}`, `[]`, `""`, `''`

**Comment toggling** ([comment.lua](lua/plugins/comment.lua))
- Toggle line comment: `gcc`
- Toggle block comment: `gbc`
- Visual mode: `gc`

**Status line** ([lualine.lua](lua/plugins/lualine.lua))
- Shows mode, git branch, diagnostics, file info

---

## First Time Setup

After restarting Neovim:

1. **Install plugins:** `:Lazy sync`
2. **Install language servers:** `:Mason` (they should auto-install)
3. **Install formatters:** See "Auto-Formatting" section above
4. **Restart Neovim** to apply everything

---

## Quick Reference Card

### File Navigation
- `<Space>e` - Toggle file explorer
- `<Space>ff` - Find files (Telescope)
- `<Space>fg` - Live grep (search in files)
- `<Space>fb` - Browse buffers

### LSP (IntelliSense)
- `gd` - Go to definition
- `gr` - Show references
- `gi` - Go to implementation
- `K` - Show hover info
- `<Space>ca` - Code action
- `<Space>rn` - Rename symbol
- `]d` / `[d` - Next/previous diagnostic

### Editing
- `gcc` - Toggle line comment
- `<Space>f` - Format file
- `<Tab>` - Next completion item
- `<CR>` - Confirm completion

### Git
- `<Space>gg` - Open LazyGit UI
- `]c` / `[c` - Next/previous git hunk
- `<Space>hs` - Stage hunk
- `<Space>hp` - Preview hunk

### Diagnostics
- `<Space>xx` - Toggle diagnostics panel
- `<Space>e` - Show diagnostic float

---

## Updating Plugins

```vim
:Lazy sync          " Update all plugins
:Mason              " Manage language servers
:TSUpdate           " Update treesitter parsers
```

---

## File Structure

```
~/.config/nvim/
├── init.lua                          # Main entry point
├── lua/
│   ├── options.lua                   # Neovim options
│   ├── keymaps.lua                   # Global keymaps
│   └── plugins/
│       ├── init.lua                  # Plugin loader
│       ├── colorscheme.lua           # Cyberdream theme
│       ├── lsp.lua                   # LSP configuration
│       ├── cmp.lua                   # Completion
│       ├── conform.lua               # Formatting
│       ├── gitsigns.lua              # Git integration
│       ├── lazygit.lua               # Git UI
│       ├── neo-tree.lua              # File explorer
│       ├── telescope.lua             # Fuzzy finder
│       ├── treesitter.lua            # Syntax highlighting
│       ├── treesitter_textobjects.lua # Text objects
│       ├── mini_ai.lua               # Additional text objects
│       ├── autopairs.lua             # Auto-close brackets
│       ├── comment.lua               # Comment toggling
│       ├── lualine.lua               # Status line
│       ├── trouble.lua               # Diagnostics panel
│       └── whichkey.lua              # Keybinding hints
├── TREESITTER_UPDATE_GUIDE.md        # Treesitter maintenance
└── VSCODE_REPLACEMENT_GUIDE.md       # This file
```

---

## Troubleshooting

### LSP not working
1. Run `:LspInfo` to see attached servers
2. Run `:Mason` to check if servers are installed
3. Try `:LspRestart`

### Completion not showing
1. Make sure you're in Insert mode
2. Press `<C-Space>` to manually trigger
3. Check `:checkhealth cmp`

### Formatting not working
1. Install formatters (see setup above)
2. Check `:ConformInfo`
3. Manually format with `<Space>f`

### General issues
Run `:checkhealth` to diagnose problems

---

## What's Different from VSCode

### Better
- Lightning fast
- Keyboard-driven workflow
- Highly customizable
- Low resource usage

### Different
- No built-in GUI (you're in the terminal)
- Steeper learning curve
- Need to install external tools (formatters, linters)
- Different keybindings (but more efficient!)

### Takes Practice
- Modal editing (Normal/Insert/Visual modes)
- Keybinding muscle memory
- Command-line workflow

---

## Next Steps

1. **Practice the keybindings** - They'll become second nature
2. **Customize to your taste** - Edit the plugin configs
3. **Learn Vim motions** - `vimtutor` is a great resource
4. **Add more plugins** as needed for your workflow

Enjoy your new supercharged Neovim setup! 🚀
