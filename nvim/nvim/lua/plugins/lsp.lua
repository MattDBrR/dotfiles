return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Capabilities enrichies pour la complétion
      local capabilities =
        require("cmp_nvim_lsp").default_capabilities(
          vim.lsp.protocol.make_client_capabilities()
        )

      -- =========================
      -- C / C++
      -- =========================
      vim.lsp.config.clangd = {
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
        },
      }

      -- =========================
      -- Python
      -- =========================
      vim.lsp.config.pyright = {
        capabilities = capabilities,
      }

      -- Activer les serveurs
      vim.lsp.enable({
        "clangd",
        "pyright",
      })

      -- =========================
      -- Keymaps LSP (simples)
      -- =========================
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "gr", vim.lsp.buf.references)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    end,
  },
}

