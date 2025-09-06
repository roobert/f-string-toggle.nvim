# :yarn: f-string-toggle

![f-string-toggle](https://user-images.githubusercontent.com/226654/216850121-8987bc4a-8237-40a9-90f0-0dccbf09de09.gif)

A modularised version of [this reddit post](https://www.reddit.com/r/neovim/comments/tge2ty/comment/i12ja8n/?context=3) by [u/ddmenddes_](https://www.reddit.com/user/ddmenddes_/) - all credit goes to the original author!

## Install

```lua
{
  "roobert/f-string-toggle.nvim",
  config = function()
    require("f-string-toggle").setup({
      key_binding = "<leader>f",
      key_binding_desc = "Toggle f-string",
      filetypes = { "python" },
    })
  end,
}
```

## Configure

### Disable default mapping

If you would prefer not to use the default key binding, you can set `key_binding = false` and directly call `toggle_fstring()`. Here is an example with `lazy.nvim`:

```lua
{
  "roobert/f-string-toggle.nvim",
  keys = {
    { "<leader>fs", function() require("f-string-toggle").toggle_fstring() end, desc = "Toggle f-string" }
  },
  config = function()
    require("f-string-toggle").setup({
      key_binding = false,
    })
  end,
}
```

If you want to set the mapping outside `lazy.nvim`, you can use:

```lua
vim.keymap.set('n', '<leader>f', function() require('f-string-toggle').toggle_fstring() end, { desc = "Toggle f-string" })
```


## Usage

Within a string press leader-f to toggle if it's an f-string or not.
