return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
       window = {
          completion = {
            border = "rounded",
            max_width = 32,
            min_width = 20,
          },

          documentation = {
            border = "rounded",
            max_width = 60,
            max_height = 15,
          },
        },

       formatting = {
          -- Seulement : nom + type
          fields = { "abbr", "kind" },

          format = function(_, item)
            local max = 28
            if #item.abbr > max then
              item.abbr = item.abbr:sub(1, max - 1) .. "…"
            end
            return item
          end,
        },

       mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

       sources = {
          { name = "nvim_lsp" },
        },
      })
    end,
  },
}

