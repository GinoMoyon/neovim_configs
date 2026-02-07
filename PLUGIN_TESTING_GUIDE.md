# Neovim Plugin Testing Guide

Complete manual testing checklist for all installed plugins.

---

## 1. AutoPairs (`autopairs.lua`)

**Plugin**: windwp/nvim-autopairs
**Purpose**: Auto-close brackets, quotes, and pairs

### Test Cases

- [ ] **Basic Pair Insertion**
  - Open a file in insert mode: `:e test.txt` then `i`
  - Type `(` - should auto-insert closing `)`
  - Type `{` - should auto-insert closing `}`
  - Type `[` - should auto-insert closing `]`
  - Type `"` - should auto-insert closing `"`
  - Type `'` - should auto-insert closing `'`

- [ ] **Skip Over Closing Bracket**
  - Type `(hello)` - when you type the closing `)`, it should skip over the auto-inserted one (not create `()))`)

- [ ] **Treesitter Integration**
  - In a Lua file, type a string: `local str = "`
  - Should auto-close with `"`
  - Inside JavaScript template strings, backticks should work similarly

- [ ] **CMP Integration**
  - Trigger completion (type something in a code file)
  - Select a completion with `<CR>`
  - If the completion needs parentheses (like a function), they should be added

**Status**: ⬜ Pass / ⬜ Fail

---

## 2. Completion (nvim-cmp) (`cmp.lua`)

**Plugin**: hrsh7th/nvim-cmp
**Purpose**: Auto-completion (IntelliSense)

### Test Cases

- [ ] **Basic Completion Menu**
  - Open a file with LSP support: `:e test.js` or `:e test.lua`
  - Enter insert mode and type some text
  - Completion menu should appear automatically
  - Menu should have rounded borders and icons

- [ ] **Navigation**
  - `<Tab>` - select next item
  - `<S-Tab>` - select previous item
  - `<C-Space>` - manually trigger completion
  - `<CR>` - confirm selection
  - `<C-e>` - abort/close menu

- [ ] **Documentation Window**
  - When completion menu is open, documentation should appear in a bordered window
  - `<C-f>` - scroll docs down
  - `<C-b>` - scroll docs up

- [ ] **Completion Sources**
  - LSP completions should show `[LSP]` tag
  - Buffer words should show `[Buf]` tag
  - File paths should show `[Path]` tag
  - Snippets should show `[Snip]` tag

- [ ] **Snippet Expansion**
  - Type a snippet trigger (e.g., `for` in JavaScript)
  - Select and confirm
  - Should expand to full snippet with placeholders
  - `<Tab>` should jump to next placeholder

- [ ] **Command-line Completion**
  - Press `:` to enter command mode
  - Type partial command (e.g., `:Tel`)
  - Should show completions
  - Press `/` for search
  - Type text - should complete from buffer

**Status**: ⬜ Pass / ⬜ Fail

---

## 3. Colorscheme (`colorscheme.lua`)

**Plugin**: scottmckendry/cyberdream.nvim
**Purpose**: Color theme (black background, high contrast)

### Test Cases

- [ ] **Theme Applied**
  - Background should be pure black `#000000`
  - Foreground text should be white
  - Syntax highlighting should be visible

- [ ] **Borders Visible**
  - Open Telescope: `<leader>ff`
  - Borders should be light blue `#5DADE2`
  - Open any floating window - borders should be visible

- [ ] **Window Separators**
  - Split window: `:vsplit`
  - Separator line should be light blue and visible

- [ ] **Status Line**
  - Status line should have proper colors
  - Background should be black

- [ ] **Lazy.nvim Modal**
  - Open Lazy: `:Lazy`
  - Modal should have visible light blue borders
  - Background should be black

**Status**: ⬜ Pass / ⬜ Fail

---

## 4. Comment (`comment.lua`)

**Plugin**: numToStr/Comment.nvim
**Purpose**: Toggle comments

### Test Cases

- [ ] **Single Line Comment**
  - In normal mode, place cursor on a line
  - Press `gcc`
  - Line should be commented out
  - Press `gcc` again - should uncomment

- [ ] **Multi-line Comment**
  - Select multiple lines in visual mode (`V` then move cursor)
  - Press `gc`
  - All lines should be commented
  - Repeat to uncomment

- [ ] **Comment Type Detection**
  - Test in Lua file - should use `--`
  - Test in JavaScript - should use `//`
  - Test in Python - should use `#`

- [ ] **Context-Aware (JSX/TSX)**
  - In a React file with JSX, comment inside JSX should use `{/* */}`
  - Comment in regular JS part should use `//`

**Status**: ⬜ Pass / ⬜ Fail

---

## 5. Conform (`conform.lua`)

**Plugin**: stevearc/conform.nvim
**Purpose**: Auto-formatting on save

### Test Cases

- [ ] **Format on Save**
  - Create/open a JavaScript file with bad formatting
  - Make changes and save `:w`
  - File should auto-format with Prettier

- [ ] **Manual Format**
  - Press `<leader>f` in normal mode
  - File should format immediately

- [ ] **Different File Types**
  - Test JavaScript: should use Prettier
  - Test Lua: should use stylua
  - Test Python: should use black
  - Test Markdown/JSON/YAML: should use Prettier

- [ ] **Format Selection**
  - Select lines in visual mode
  - Press `<leader>f`
  - Only selected lines should format

- [ ] **LSP Fallback**
  - For a file type without configured formatter
  - Format should fall back to LSP formatter if available

**Status**: ⬜ Pass / ⬜ Fail

---

## 6. Gitsigns (`gitsigns.lua`)

**Plugin**: lewis6991/gitsigns.nvim
**Purpose**: Git change indicators in gutter

### Test Cases

- [ ] **Visual Indicators**
  - In a git repo, make changes to a tracked file
  - Gutter should show:
    - `│` for added lines
    - `│` for changed lines
    - `_` for deleted lines
    - `┆` for untracked lines

- [ ] **Hunk Navigation**
  - `]c` - jump to next hunk
  - `[c` - jump to previous hunk

- [ ] **Hunk Actions**
  - `<leader>hp` - preview hunk in floating window
  - `<leader>hs` - stage hunk
  - `<leader>hr` - reset hunk
  - `<leader>hS` - stage entire buffer
  - `<leader>hR` - reset entire buffer
  - `<leader>hu` - undo stage hunk

- [ ] **Git Blame**
  - `<leader>hb` - show full blame for current line
  - `<leader>tb` - toggle inline blame (appears at end of line)

- [ ] **Diff View**
  - `<leader>hd` - show diff of current file
  - `<leader>hD` - show diff against HEAD~

- [ ] **Text Objects**
  - In visual/operator mode: `ih` should select git hunk
  - Try `vih` to visually select a hunk
  - Try `dih` to delete a hunk

**Status**: ⬜ Pass / ⬜ Fail

---

## 7. LazyGit (`lazygit.lua`)

**Plugin**: kdheepak/lazygit.nvim
**Purpose**: Full Git UI

### Test Cases

- [ ] **Open LazyGit**
  - Press `<leader>gg`
  - LazyGit terminal UI should open in floating window

- [ ] **Basic Git Operations**
  - Stage files (space)
  - Commit (c)
  - Push (P)
  - Pull (p)
  - View log (l)

- [ ] **Close LazyGit**
  - Press `q` to quit
  - Should return to Neovim

- [ ] **Alternative Commands**
  - `:LazyGit` - should open
  - `:LazyGitCurrentFile` - should open focused on current file

**Status**: ⬜ Pass / ⬜ Fail

---

## 8. LSP (`lsp.lua`)

**Plugin**: neovim/nvim-lspconfig + Mason
**Purpose**: Language Server Protocol (code intelligence)

### Test Cases

- [ ] **Mason Installation**
  - Run `:Mason`
  - Should show package manager UI with rounded borders
  - Check that these are installed: `ts_ls`, `eslint`, `lua_ls`, `pyright`
  - Icons: `✓` (installed), `➜` (pending), `✗` (not installed)

- [ ] **LSP Attach**
  - Open a TypeScript/JavaScript file
  - Wait a moment - LSP should attach
  - Check `:LspInfo` - should show active clients

- [ ] **Diagnostics**
  - Introduce an error in code (e.g., undefined variable)
  - Should show diagnostic signs in gutter: ` ` (error), ` ` (warning)
  - Virtual text should appear at end of line
  - `]d` - next diagnostic
  - `[d` - previous diagnostic
  - `<leader>e` - show diagnostic in floating window

- [ ] **Navigation**
  - Place cursor on a function/variable
  - `gd` - go to definition
  - `gD` - go to declaration
  - `gr` - show references
  - `gi` - go to implementation

- [ ] **Hover Info**
  - Place cursor on symbol
  - Press `K` - should show hover documentation in floating window
  - `<leader>k` - show signature help

- [ ] **Code Actions**
  - On a line with available actions (e.g., import suggestion)
  - `<leader>ca` - should show code action menu
  - Select an action - should apply

- [ ] **Rename**
  - Place cursor on a symbol
  - `<leader>rn` - should prompt for new name
  - Enter new name - should rename all occurrences

- [ ] **Multiple Languages**
  - Test in Lua file - lua_ls should work
  - Test in Python file - pyright should work
  - Test in JavaScript/TypeScript - ts_ls should work

**Status**: ⬜ Pass / ⬜ Fail

---

## 9. Lualine (`lualine.lua`)

**Plugin**: nvim-lualine/lualine.nvim
**Purpose**: Status line

### Test Cases

- [ ] **Status Line Visible**
  - At bottom of screen, should see single status line (even with multiple windows)

- [ ] **Sections**
  - **Left**: Mode (NORMAL/INSERT/VISUAL), git branch, diff stats, diagnostics
  - **Center**: Filename with relative path
  - **Right**: Encoding, file format, file type, progress %, line:column

- [ ] **Dynamic Updates**
  - Switch modes (i, v, V) - mode should update
  - Make changes - diff should update
  - Introduce errors - diagnostics should update

- [ ] **Theme**
  - Should match the colorscheme (cyberdream)

**Status**: ⬜ Pass / ⬜ Fail

---

## 10. Mini.ai (`mini_ai.lua`)

**Plugin**: echasnovski/mini.ai
**Purpose**: Enhanced text objects

### Test Cases

- [ ] **Function Text Objects**
  - In a file with functions, place cursor inside a function
  - `vif` - select inner function
  - `vaf` - select around function (including signature)
  - `dif` - delete inner function
  - `yaf` - yank around function

- [ ] **Class Text Objects**
  - In a file with classes
  - `vic` - select inner class
  - `vac` - select around class
  - `dic`, `yac` - delete/yank variants

- [ ] **Block Text Objects**
  - `vib` - select inner block `{...}`
  - `vab` - select around block

- [ ] **Conditional Text Objects**
  - `vio` - select inner if/else block
  - `vao` - select around if/else

- [ ] **Loop Text Objects**
  - `vil` - select inner loop (for/while)
  - `val` - select around loop

- [ ] **Parameter Text Objects**
  - Place cursor in function parameters
  - `vip` - select inner parameter
  - `vap` - select around parameter

**Status**: ⬜ Pass / ⬜ Fail

---

## 11. Neo-tree (`neo-tree.lua`)

**Plugin**: nvim-neo-tree/neo-tree.nvim
**Purpose**: File explorer sidebar

### Test Cases

- [ ] **Toggle Explorer**
  - `<leader>e` - toggle neo-tree
  - Should open on left side with width 30
  - Press again - should close

- [ ] **Focus Explorer**
  - `<leader>o` - focus neo-tree (open if closed)

- [ ] **Navigation**
  - Use `j`/`k` or arrow keys to move
  - `<CR>` or `o` - open file/folder
  - `C` - close folder node
  - `z` - close all nodes
  - `R` - refresh

- [ ] **File Operations**
  - `a` - add file/folder
  - `d` - delete file/folder (should prompt)
  - `r` - rename
  - `c` - copy
  - `x` - cut
  - `p` - paste
  - `y` - copy to clipboard

- [ ] **Split Opening**
  - Select a file
  - `s` - open in horizontal split
  - `v` - open in vertical split
  - `t` - open in new tab

- [ ] **Git Integration**
  - In a git repo, should see git status icons:
    - `✚` added
    - `✖` deleted
    - `` modified
    - `` untracked
    - `` staged

- [ ] **File Icons**
  - Should see folder icons: `` (closed), `` (open)
  - Should see file type icons (if nvim-web-devicons installed)

- [ ] **Auto-follow Current File**
  - Open a file from neo-tree
  - Open another file from elsewhere
  - Neo-tree should highlight the current file

- [ ] **Close on File Open**
  - Open neo-tree
  - Open a file
  - Neo-tree should auto-close

- [ ] **Filtered Items**
  - `node_modules` and `.git` should be hidden
  - Dotfiles should be visible

**Status**: ⬜ Pass / ⬜ Fail

---

## 12. Telescope (`telescope.lua`)

**Plugin**: nvim-telescope/telescope.nvim
**Purpose**: Fuzzy finder

### Test Cases

- [ ] **Find Files**
  - `<leader>ff` - open file finder
  - Should show fuzzy searchable list of files
  - Type to filter
  - `<CR>` to open
  - `<C-x>` horizontal split
  - `<C-v>` vertical split
  - `<C-t>` new tab
  - `<Esc>` to close

- [ ] **Live Grep**
  - `<leader>fg` - open live grep
  - Type search term
  - Should show matches across all files with preview
  - Navigate with `<C-j>`/`<C-k>` or arrows

- [ ] **Buffers**
  - Open multiple files
  - `<leader>fb` - show buffer list
  - Should show all open buffers
  - Select to switch

- [ ] **Help Tags**
  - `<leader>fh` - search help tags
  - Type search term (e.g., "telescope")
  - Should show help documentation

- [ ] **Layout**
  - All pickers should use horizontal layout
  - Should have preview window

**Status**: ⬜ Pass / ⬜ Fail

---

## 13. Treesitter (`treesitter.lua`)

**Plugin**: nvim-treesitter/nvim-treesitter
**Purpose**: Syntax parsing and highlighting

### Test Cases

- [ ] **Syntax Highlighting**
  - Open supported files: Lua, Python, JavaScript, TypeScript, TSX
  - Syntax should be highlighted accurately
  - Colors should be more precise than regex-based highlighting

- [ ] **Parser Installation**
  - Run `:TSInstallInfo`
  - Should show installed parsers: lua, vim, vimdoc, python, javascript, typescript, tsx

- [ ] **Treesitter Start**
  - Open a Lua file
  - Check `:InspectTree` - should show syntax tree
  - If highlighting seems off, try `:TSEnable highlight`

- [ ] **Folding**
  - Open a file with functions/classes
  - Treesitter folding should be enabled
  - Use `zc` to close fold, `zo` to open fold
  - Folds should be based on code structure (functions, classes)
  - All folds should start open (foldlevel=99)

**Status**: ⬜ Pass / ⬜ Fail

---

## 14. Treesitter Text Objects (`treesitter_textobjects.lua`)

**Plugin**: nvim-treesitter/nvim-treesitter-textobjects
**Purpose**: Code-aware text objects and navigation

### Test Cases

- [ ] **Function Navigation**
  - In a file with multiple functions
  - `]f` - next function start
  - `]F` - next function end
  - `[f` - previous function start
  - `[F` - previous function end

- [ ] **Class Navigation**
  - In a file with classes
  - `]c` - next class start
  - `]C` - next class end
  - `[c` - previous class start
  - `[C` - previous class end

- [ ] **Selection Modes**
  - Select a function: should use linewise selection (V)
  - Select a parameter: should use charwise selection (v)

**Note**: This plugin works together with mini.ai for text object selection

**Status**: ⬜ Pass / ⬜ Fail

---

## 15. Trouble (`trouble.lua`)

**Plugin**: folke/trouble.nvim
**Purpose**: Diagnostics panel (like VSCode Problems)

### Test Cases

- [ ] **Toggle Diagnostics**
  - Introduce errors/warnings in code
  - `<leader>xx` - toggle diagnostics panel
  - Should show all diagnostics from all files
  - Should use same diagnostic icons as LSP

- [ ] **Buffer Diagnostics**
  - `<leader>xX` - show diagnostics for current buffer only

- [ ] **Location List**
  - `<leader>xL` - toggle location list

- [ ] **Quickfix List**
  - `<leader>xQ` - toggle quickfix list

- [ ] **Navigation in Panel**
  - Use `j`/`k` to navigate
  - `<CR>` to jump to issue
  - `q` to close panel

- [ ] **Auto-update**
  - Fix an error
  - Trouble panel should update automatically

**Status**: ⬜ Pass / ⬜ Fail

---

## 16. Which-Key (`whichkey.lua`)

**Plugin**: folke/which-key.nvim
**Purpose**: Keymap helper popup

### Test Cases

- [ ] **Leader Key Menu**
  - Press `<leader>` (space) and wait ~1 second
  - Should show popup with available keymaps
  - Should show descriptions for each keymap

- [ ] **Nested Menus**
  - Press `<leader>h` - should show git hunk submenu
  - Press `<leader>f` - might show find/format options
  - Press `<leader>x` - should show trouble submenu

- [ ] **Mode-Specific**
  - Try in normal mode
  - Try in visual mode (some mappings are mode-specific)

- [ ] **Other Prefixes**
  - Press `g` and wait - should show g-prefixed commands
  - Press `]` and wait - should show next/forward commands
  - Press `[` and wait - should show previous/backward commands

**Status**: ⬜ Pass / ⬜ Fail

---

## Testing Workflow Recommendation

### Daily Usage Testing
1. Start with: Neo-tree, Telescope, LSP, CMP
2. Then: Gitsigns, Comment, Conform
3. Finally: Trouble, LazyGit

### Weekly Deep Testing
- Mini.ai, Treesitter Text Objects
- Which-Key
- Colorscheme edge cases

### Per-Language Testing
- LSP: Test each language (TS, JS, Lua, Python)
- Treesitter: Verify highlighting per language
- Comment: Test comment syntax per language

---

## Common Issues Checklist

- [ ] If completions don't work: Check `:LspInfo` and `:Mason`
- [ ] If formatting fails: Check if formatter is installed (`:Mason`)
- [ ] If syntax highlighting is wrong: Run `:TSUpdate`
- [ ] If keymaps don't work: Check `:WhichKey` or `:map <leader>`
- [ ] If LazyGit won't open: Ensure `lazygit` is installed on system
- [ ] If icons don't show: Install a Nerd Font

---

## Overall System Health Check

Run these commands periodically:

```vim
:checkhealth
:Mason
:Lazy
:TSInstallInfo
:LspInfo
```

---

**Last Updated**: 2026-01-25
