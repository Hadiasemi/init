# 🛠️ Neovim Shortcuts & Keybindings

This document lists all the keybindings and shortcuts configured in my Neovim setup.  
Leader key is set to **`,`**.

---

## 📂 File & Buffer Management
| Shortcut | Action |
|----------|--------|
| `<C-n>`  | Toggle **NvimTree** |
| `-`      | Find current file in **NvimTree** |
| `<Tab>`  | Next buffer |
| `<S-Tab>`| Previous buffer |
| `<C-x>`  | Close current buffer |
| `:Bd`    | Close buffer but keep window layout |

---

## 📑 Window Navigation
| Shortcut | Action |
|----------|--------|
| `<C-h>`  | Move to left split |
| `<C-j>`  | Move to below split |
| `<C-k>`  | Move to above split |
| `<C-l>`  | Move to right split |

---

## 🔍 Search & Highlight
| Shortcut | Action |
|----------|--------|
| `,x`     | Close preview window |
| `/`      | Incremental search (live updates) |
| *(auto)* | Highlights cleared when entering/leaving insert mode |

---

## 🔭 Telescope
| Shortcut | Action |
|----------|--------|
| `,ff`    | Find files |
| `,fg`    | Live grep |
| `,fb`    | Search buffers |
| `,fh`    | Search help tags |

---

## ⚡ Coc.nvim (LSP / Autocomplete)
| Shortcut | Action |
|----------|--------|
| `<C-Space>` | Trigger completion |
| `<Tab>`     | Next completion item |
| `<S-Tab>`   | Previous completion item |
| `,o`        | Show documentation (hover) |
| `,x`        | Close all floating windows |
| `,jd`       | Jump to definition |
| `,jr`       | Jump to references |
| `,qf`       | Quick fix issue |
| `,ac`       | Code actions at cursor |
| `,sd`       | Toggle diagnostics |
| `,nd`       | Next diagnostic |
| `,pd`       | Previous diagnostic |

---

## 📝 Markdown & Docs
| Shortcut | Action |
|----------|--------|
| `<C-s>`  | Markdown preview |

---

## 🚀 Plugins
| Shortcut | Action |
|----------|--------|
| `<F8>`   | Toggle Tagbar |
| `<F9>`   | Toggle Pudb debugger |
| `cc`     | Comment line (NERDCommenter) |
| `cc` (Visual) | Comment selection |

---

## 🖱️ Mouse
| Shortcut | Action |
|----------|--------|
| `<C-LeftMouse>` | Jump to definition (Jedi) |

---

## 🏃 Leap.nvim
- Motions with `s{char}{char}` to leap to target  
- Works across lines and windows

---

## 📐 Miscellaneous
- Column marker at **80** (default) and **100** for Rust
- Colorscheme: **Monokai-Pro (Octagon filter)**
- Swap/backup files disabled for clean workflow

---

✨ **Pro tip:**  
Keep this README pinned in your Neovim config repo for quick reference.
