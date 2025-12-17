return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            
            filesystem = {
                filtered_items = {
                    visible = false,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = {
                        "__pycache__",
                        ".git",
                        "node_modules",
                    },
                },
                follow_current_file = {
                    enabled = true,
                },
                use_libuv_file_watcher = true,
            },
            
            window = {
                width = 30,
                mappings = {
                    ["<space>"] = "none", -- disable space so it doesn't conflict with leader
                    ["P"] = { "toggle_preview", config = { use_float = true } },
                },
            },
            
            default_component_configs = {
                git_status = {
                    symbols = {
                        added     = "✚",
                        modified  = "",
                        deleted   = "✖",
                        renamed   = "󰁕",
                        untracked = "",
                        ignored   = "",
                        unstaged  = "󰄱",
                        staged    = "",
                        conflict  = "",
                    },
                },
            },
        })

        -- Keymaps
        vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", { desc = "Open file tree" })
        vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", { desc = "Open buffers float" })
        vim.keymap.set("n", "<leader>gs", ":Neotree git_status float<CR>", { desc = "Git status float" })
    end,
}
