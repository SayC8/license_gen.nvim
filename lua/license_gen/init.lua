local templates = require("license_gen.templates")

local M = {}

M.config = {
    default_name = nil,
}

function M.setup(opts)
    M.config = vim.tbl_deep_extend("force", M.config, opts or {})

    vim.api.nvim_create_user_command("AddLicense", function(cmd_opts)
        M.create_license(cmd_opts.args)
    end, {
        nargs = "?",
        desc = "Add a LICENSE file",
        complete = function()
            return vim.tbl_keys(templates.licenses)
        end,
    })
end

local function write_license_file(choice, name)
    local content = templates.licenses[choice]
    if not content then
        vim.notify("License '" .. choice .. "' not found.", vim.log.levels.ERROR)
        return
    end

    local year = os.date("%Y")
    content = content:gsub("%[year%]", year)
    content = content:gsub("%[fullname%]", name)

    local path = vim.fn.getcwd() .. "/LICENSE"
    local file = io.open(path, "w")
    if file then
        file:write(content)
        file:close()
        vim.notify("LICENSE file (" .. choice .. ") created successfully!")
        vim.cmd("edit " .. vim.fn.fnameescape(path))
    end
end

function M.create_license(arg)
    local license_names = vim.tbl_keys(templates.licenses)

    local name = M.config.default_name
    if not name or name == "" then
        local git_obj = vim.system({ "git", "config", "user.name" }, { text = true }):wait()
        name = vim.trim(git_obj.stdout or "")
    end

    if arg and arg ~= "" then
        -- User provided and argument
        write_license_file(arg, name)
    else
        -- No argument show selection
        vim.ui.select(license_names, {
            prompt = "Select a License Type:",
        }, function(choice)
            if choice then
                write_license_file(choice, name)
            end
        end)
    end
end

return M
