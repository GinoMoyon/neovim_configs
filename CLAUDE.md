# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a Neovim configuration built on **lazy.nvim** plugin manager. The configuration uses **Neovim 0.11+** APIs, including:
- Modern `vim.lsp.config()` and `vim.lsp.enable()` API (not `lspconfig.setup()`)
- Treesitter `main` branch with direct `vim.treesitter.start()` autocmds (not `configs.setup()`)
- Treesitter-textobjects on `main` branch with its own `setup()` function

### Entry Point & Structure

- **init.lua**: Entry point that loads `options`, `keymaps`, and `plugins`
- **lua/options.lua**: Neovim settings (line numbers, tabs, timeouts)
- **lua/keymaps.lua**: Global keymaps including custom clipboard behavior
- **lua/plugins/init.lua**: Plugin loader using lazy.nvim
- **lua/plugins/*.lua**: Individual plugin configurations (one file per plugin/feature)

### Clipboard Behavior (Important!)

This config has **custom clipboard handling**:
- `y`/`d`/`c` operations go to vim's unnamed register only (NOT system clipboard)
- `<leader>y`/`<leader>d` explicitly copy/delete to system clipboard
- `<leader>p`/`<leader>P` paste from system clipboard
- This prevents delete operations from polluting the system clipboard

## Plugin Management

**lazy.nvim** is bootstrapped in `lua/plugins/init.lua`. Plugins auto-install on first launch.

### Key Commands
```vim
:Lazy sync          " Update all plugins
:Mason              " Manage LSP servers, formatters, linters
:TSUpdate           " Update treesitter parsers
:checkhealth        " Diagnose configuration issues
```

### LSP Configuration (lsp.lua)

Uses **Mason** for automatic LSP server installation with these servers:
- `ts_ls` (TypeScript/JavaScript)
- `eslint`
- `lua_ls` (Lua)
- `pyright` (Python)

**Important**: Uses Neovim 0.11+ `vim.lsp.config()` API, not the old `lspconfig.ts_ls.setup()` pattern.

To add a new language server:
1. Add to `ensure_installed` in mason-lspconfig setup
2. Add config block: `vim.lsp.config('server_name', { capabilities = capabilities })`
3. Enable it: `vim.lsp.enable('server_name')`

### Treesitter Configuration (treesitter.lua)

Uses **main branch** (not master/deprecated API). Parsers auto-install for: lua, vim, vimdoc, python, javascript, typescript, tsx.

Highlighting is enabled via autocmd that calls `vim.treesitter.start()` for specific filetypes.

To add a new language:
1. Add parser name to `require("nvim-treesitter").install()` call
2. Add filetype pattern to autocmd at line 16
3. Run `:TSInstall <language>`

### Formatting (conform.lua)

Auto-formats on save using external formatters:
- JavaScript/TypeScript/React: **prettier**
- Lua: **stylua**
- Python: **black**

**First-time setup**: Users must install formatters externally:
```bash
npm install -g prettier
cargo install stylua
pip install black
```

To add a new formatter:
1. Add to `formatters_by_ft` in conform.lua
2. Install the formatter binary
3. Optionally customize in `formatters` table

## Development Workflow

### Testing Changes
When modifying plugin configs:
1. Save the file
2. Restart Neovim (`:qa` then reopen) or reload config (`:source %`)
3. Check `:Lazy` to see if plugin needs to be synced
4. Run `:checkhealth` to verify
5. Use PLUGIN_TESTING_GUIDE.md for comprehensive testing

### Common Tasks

**Update all plugins and parsers:**
```vim
:Lazy sync
:TSUpdate
```

**Fix LSP issues:**
```vim
:LspInfo          " Check attached servers
:Mason            " Verify server installation
:LspRestart       " Restart LSP client
```

**Format troubleshooting:**
```vim
:ConformInfo      " Check formatter status
```

**Check parser status:**
```vim
:TSInstallInfo    " List installed parsers
:checkhealth nvim-treesitter
```

## Key Architectural Decisions

1. **Custom clipboard behavior**: Separates vim and system clipboards to prevent delete operations from overwriting system clipboard
2. **Modern Neovim APIs**: Uses 0.11+ APIs for LSP and treesitter (not legacy patterns)
3. **Lazy loading**: Most plugins load on demand (BufReadPre, BufNewFile) for fast startup
4. **Mason auto-install**: LSP servers install automatically when opening relevant file types
5. **Format on save**: Enabled for most file types with LSP fallback
6. **Pure black theme**: cyberdream colorscheme with #000000 background and light blue borders
7. **Single status line**: lualine configured for global status line (not per-window)

## Important Files to Reference

- **PLUGIN_TESTING_GUIDE.md**: Comprehensive testing checklist for all plugins
- **TREESITTER_UPDATE_GUIDE.md**: How to maintain treesitter config and update parsers
- **VSCODE_REPLACEMENT_GUIDE.md**: Quick reference for VSCode users transitioning to this setup
