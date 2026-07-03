vim.api.nvim_create_user_command("ObsivimToday", function()
  require("obsivim").journal()
end, { desc = "Open today's journal" })
