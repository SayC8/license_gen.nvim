A lightweight Neovim plugin for quickly generating LICENSE files
in your project directory.

## Features

Supports multiple license types: MIT, Apache 2.0, GPL v3, etc. (more later maybe idk)
Automatically detects your name from git config (can be overridden, see below )
and the current year.

Generates a LICENSE file in your current working directory.
If a LICENSE already exists, asks for confirmation before overwriting.

## Requirements

- Git (Used to fetch user.name for the license text)
- Neovim 0.10+ (Optimized for 0.11)

## Installation

Example using Lazy:

```Lua
{
    "SayC8/license_gen.nvim",
        cmd = "AddLicense",
        config = function()
            require("license_gen").setup({
                    default_name = "John Doe", -- Optional: overrides git config name
                    })
    end
}
```

## Usage

Should integrate with plugins like mini.pick / telescope

```
:AddLicense <license-name>
or
:AddLicense
```

