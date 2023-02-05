# :sunflower: f-string-toggle

![f-string-toggle](https://user-images.githubusercontent.com/226654/216850121-8987bc4a-8237-40a9-90f0-0dccbf09de09.gif)

A modularised version of [this reddit post](https://www.reddit.com/r/neovim/comments/tge2ty/comment/i12ja8n/?context=3) by [u/ddmenddes_](https://www.reddit.com/user/ddmenddes_/) - all credit goes to the original author!

## Install

```
{
  "roobert/fs-string-toggle.nvim",
  config = function()
    require("fs-string-toggle").setup({
      key_binding = "<leader>f"
    })
  end,
}
```

## Usage

Within a string press leader-f to toggle if it's an f-string or not.
