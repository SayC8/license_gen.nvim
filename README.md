## Features
Generates a LICENSE file in your current working directory.
If a LICENSE already exists, asks for confirmation before overwriting.

Currently only supports MIT license.
Automatically detects your name from git config (can be overridden, see below )
and the current year.

## Requirements
- Git (Used to fetch user.name for the license text)
- Neovim 0.11+

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
Integrates with plugins like mini.pick / telescope
```
:AddLicense <license-name>
or
:AddLicense
```
