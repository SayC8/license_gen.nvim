# license_gen.nvim

A lightweight, no-nonsense Neovim plugin written in Lua to quickly generate LICENSE files for your projects.

## ✨ Features

Supports multiple license types (MIT, Apache 2.0, GPL v3, etc.).

Automatically detects your name from git config and the current year.

Uses vim.ui.select to integrate with your favorite picker (Telescope, fzf-lua, etc.).

Built with Neovim 0.11 features in mind.


## 🛠️ Requirements

- Neovim 0.10+ (Optimized for 0.11)
- Git (Used to fetch user.name for the license text)

## 📦 Installation
Using lazy.nvim

Add the following to your plugin specification:
```Lua
{
    "SayC8/license_gen.nvim",
        cmd = "GenerateLicense",
        opts = {
            default_name = "John Doe", -- Optional: overrides git config
                extra_licences = { -- Optional: add your own templates
                    MyCustomLicense = "Copyright (c) [year] [fullname]\nAll rights reserved."
                }
        }
}
```

## 🚀 Usage

Simply run the following command in your terminal buffer:
```Vim Script
:GenerateLicense
```

Select your desired license from the dropdown.

The plugin will generate a LICENSE file in your current working directory.

If a LICENSE already exists, it will ask for confirmation before overwriting.
