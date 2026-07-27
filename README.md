A lightweight Neovim plugin for quickly generating LICENSE files
in your project directory.

## Features

Currently only supports MIT license. More will be added at a later time.
Automatically detects your name from git config (can be overridden, see below )
and the current year.

Generates a LICENSE file in your current working directory.
If a LICENSE already exists, asks for confirmation before overwriting.

## Requirements

- Git (Used to fetch user.name for the license text)
- Neovim 0.10+ (Optimized for 0.11)

## Installation

Using vim.pack:

``` Lua
vim.pack.add{"https://github.com/SayC8/license_gen.nvim"}
require("license_gen").setup({
	default_name = "John Doe", -- Optional: overrides git config name
    })
```

Using Lazy:

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
