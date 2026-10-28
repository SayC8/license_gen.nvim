local M = {}

M.check = function()
    vim.health.start("license_gen.nvim report")

    if vim.fn.executable("git") == 1 then
        vim.health.ok("git is installed")
    else
        vim.health.error("git is not installed. Git detection will fail.")
    end
end

return M
