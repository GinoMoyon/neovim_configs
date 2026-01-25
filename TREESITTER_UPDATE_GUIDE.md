# Treesitter Configuration - Update & Maintenance Guide

## Current Configuration (2026)

Your Neovim Treesitter setup is now using the **latest API** and will receive ongoing updates.

### What Changed

1. **nvim-treesitter**: Now on `main` branch (latest API)
   - No longer uses `nvim-treesitter.configs.setup()`
   - Highlighting enabled via `vim.treesitter.start()` autocmds
   - Parser installation via `require("nvim-treesitter").install()`

2. **nvim-treesitter-textobjects**: Now on `main` branch (latest API)
   - No longer uses `nvim-treesitter.configs` for configuration
   - Has its own `setup()` function
   - Keymaps defined via `vim.keymap.set()` with direct function calls

3. **Removed deprecated `branch = "master"`** - Both plugins now track active development

---

## How to Update in the Future

### Regular Updates (Recommended: Monthly)

1. **Update all plugins:**
   ```vim
   :Lazy sync
   ```

2. **Update parsers:**
   ```vim
   :TSUpdate
   ```

3. **Check health:**
   ```vim
   :checkhealth nvim-treesitter
   ```

### When Breaking Changes Occur

If after updating you see errors about missing modules or functions:

1. **Check the plugin README:**
   - nvim-treesitter: `~/.local/share/nvim/lazy/nvim-treesitter/README.md`
   - nvim-treesitter-textobjects: `~/.local/share/nvim/lazy/nvim-treesitter-textobjects/README.md`

2. **Look for migration guides or API changes**

3. **Common signs of breaking changes:**
   - "module not found" errors
   - "function not found" errors
   - Keymaps not working

---

## Current Feature Set

### Textobject Selection (via mini.ai)
- `vif` / `vaf` - function inner/around
- `vic` / `vac` - class inner/around
- `vib` / `vab` - block inner/around
- `vio` / `vao` - conditional inner/around
- `vil` / `val` - loop inner/around
- `vip` / `vap` - parameter inner/around

### Navigation (via treesitter-textobjects)
- `]f` / `[f` - Jump to next/previous function start
- `]F` / `[F` - Jump to next/previous function end
- `]c` / `[c` - Jump to next/previous class start
- `]C` / `[C` - Jump to next/previous class end

### Built-in Features
- **Syntax highlighting**: Auto-enabled for configured filetypes
- **Code folding**: Enabled via treesitter for configured filetypes
- **Bracket matching**: Native Neovim `%` command

---

## Adding New Languages

To add support for a new language:

1. **Install the parser:**
   ```vim
   :TSInstall <language>
   ```

2. **Add to auto-install list:**
   Edit `~/.config/nvim/lua/plugins/treesitter.lua` line 10:
   ```lua
   require("nvim-treesitter").install({
     "lua", "vim", "vimdoc", "python", "javascript", "typescript", "tsx",
     "rust", -- add new languages here
   })
   ```

3. **Enable highlighting for the filetype:**
   Edit line 16 to add the filetype pattern:
   ```lua
   pattern = { "lua", "vim", "python", ..., "rust" },
   ```

---

## Troubleshooting

### Parser Issues

**Problem:** Parser fails to install or shows errors
**Solution:**
```vim
:TSUninstall <language>
:TSInstall <language>
```

**Problem:** Parser query errors (like "Invalid node type")
**Solution:** The parser and queries may be out of sync. Try:
```vim
:TSUpdate <language>
```

### Highlighting Issues

**Problem:** No syntax highlighting
**Check:**
1. Is the filetype in the autocmd pattern? (treesitter.lua line 16)
2. Run `:TSBufToggle highlight` to toggle it on/off
3. Check `:checkhealth nvim-treesitter`

### Textobject Issues

**Problem:** `af`, `if` not working
**Solution:** This is handled by mini.ai, check `~/.config/nvim/lua/plugins/mini_ai.lua`

**Problem:** Navigation (`]f`, `[f`) not working
**Solution:** Check `:checkhealth nvim-treesitter-textobjects`

---

## Staying Updated

### Official Resources

- **nvim-treesitter GitHub**: https://github.com/nvim-treesitter/nvim-treesitter
- **nvim-treesitter-textobjects GitHub**: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
- **Neovim Treesitter docs**: `:help treesitter`

### Recommended Update Schedule

- **Plugins**: Update monthly via `:Lazy sync`
- **Parsers**: Update after plugin updates via `:TSUpdate`
- **Health checks**: Run `:checkhealth` after major updates

### Signs You Need to Update Config

1. Error messages about deprecated functions
2. Features stop working after updates
3. README mentions migration guides
4. `:checkhealth` shows warnings about API versions

---

## Configuration Files

Your treesitter setup consists of these files:

1. `~/.config/nvim/lua/plugins/treesitter.lua` - Core treesitter config
2. `~/.config/nvim/lua/plugins/treesitter_textobjects.lua` - Navigation keymaps
3. `~/.config/nvim/lua/plugins/mini_ai.lua` - Textobject selections
4. `~/.config/nvim/lua/plugins/init.lua` - Plugin loader

All are configured to use the **latest APIs** and will receive ongoing updates.

---

## Version Info (Last Updated: 2026-01)

- **nvim-treesitter**: main branch (rewrite, active development)
- **nvim-treesitter-textobjects**: main branch (new API)
- **Neovim requirement**: 0.11.0+ (you have 0.11.5 ✓)
- **tree-sitter-cli requirement**: 0.26.1+ (you have 0.26.3 ✓)
