vim.api.nvim_create_user_command("GenerateLicense", function()
    require("license_gen").create_license()
end, { desc = "Select and generate a LICENSE file" })
