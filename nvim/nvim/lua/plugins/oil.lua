return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("oil").setup({
      lsp_file_methods = {
        enabled = true,
        timeout_ms = 1000,
        autosave_changes = true,
      },
      columns = {
        "permissions",
        "icon",
      },
      float = {
        max_width = 0.7,
        max_height = 0.6,
        border = "rounded",
      },
    })

    -- Keymaps
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
