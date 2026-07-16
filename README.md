# obsivim

Lightweight Neovim plugin to open or create today's journal markdown file.

## Install

**lazy.nvim**

```lua
{
  "ernowo-git/obsivim",
  cmd = "ObsivimToday", -- should start with uppercase later
  config = function()
    require("obsivim").setup({
      dir = "~/Journal", -- change it with your obsidian journal absolute path
    })
  end,
}
```

**packer**

```lua
use("ernowo-git/obsivim")
```

**vim-plug**

```vim
Plug 'ernowo-git/obsivim'
```

## Usage

```vim
:ObsivimToday
```

Creates `~/Journal/YYYY-MM-DD.md` if missing, then opens it. New files are empty unless a template is found.

`dir` is the **Journal folder** where daily files are stored — not your Obsidian vault root.

## Config

```lua
require("obsivim").setup({
  dir = "~/Journal",              -- Journal folder (not vault root)
  date_format = "%Y-%m-%d",       -- Lua os.date format (`.md` is appended)
  template = "obsivim_template.md", -- optional template filename
})
```

`template` is looked up in `dir` first, then as an absolute/relative path.

### Examples

Weekly journal filename:

```lua
require("obsivim").setup({ date_format = "%Y-week-%V" })
```

Obsidian vault Journal folder:

```lua
require("obsivim").setup({
  dir = "~/Documents/obsidian/Journal",
})
```

Custom template path:

```lua
require("obsivim").setup({
  dir = "~/notes/Journal",
  template = "~/notes/obsivim_template.md",
})
```

Place `obsivim_template.md` in your journal directory (or set `template` to its path) to prefill new entries.

## License

MIT
