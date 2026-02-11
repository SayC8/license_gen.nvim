local templates = require("license_gen.templates")

local M = {}

M.config = {
    default_name = nil,
}

function M.setup(opts)
    M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.create_license()
    local license_names = vim.tbl_keys(templates.licenses)

    vim.ui.select(license_names, {
        prompt = "Select a License Type:",
    }, function(choice)
        if not choice then return end

        local year = os.date("%Y")

        local name = M.config.default_name
        if not name or name == "" then
            local git_obj = vim.system({ "git", "config", "user.name" }, { text = true }):wait()
            name = vim.trim(git_obj.stdout)
        end

        local content = templates.licenses[choice]

        content = content:gsub("%[year%]", year)
        content = content:gsub("%[fullname%]", name)

        local path = vim.fn.getcwd() .. "/LICENSE"
        local file = io.open(path, "w")
        if file then
            file:write(content)
            file:close()
            vim.notify("LICENSE file created successfully!")
            vim.cmd("edit " .. vim.fn.fnameescape(path))
        end
    end)
end

return M
