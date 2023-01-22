# f-string-toggle

A modularised version of [this reddit post](https://www.reddit.com/r/neovim/comments/tge2ty/comment/i12ja8n/?context=3) by [u/ddmenddes_](https://www.reddit.com/user/ddmenddes_/).

## Install

```
{
  "roobert/fs-string-toggle.nvim",
  config = function()
    require("fs-string-toggle").setup()
  end,
}
```

## Usage

Within a string press leader-f to toggle if it's an f-string or not.
