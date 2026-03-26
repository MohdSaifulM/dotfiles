return {
    {
        'zbirenbaum/copilot.lua',
        cmd = 'Copilot',
        event = "InsertEnter",
        config = function()
            require('copilot').setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    keymap = {
                        accept = "<A-l>",
                        next = "<A-n>",
                        prev = "<A-p>",
                        dismiss = "<A-j>"
                    }
                }
            })
        end,
    },
    {
        "olimorris/codecompanion.nvim",
        opts = {},
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("codecompanion").setup({
                display = {
                    chat = {
                        -- Change the default icons
                        icons = {
                            buffer_pin = " ",
                            buffer_watch = "👀 ",
                        },

                        -- Options to customize the UI of the chat buffer
                        window = {
                            layout = "vertical", -- float|vertical|horizontal|buffer
                            position = "right", -- left|right|top|bottom (nil will default depending on vim.opt.splitright|vim.opt.splitbelow)
                            border = "single",
                            height = 0.8,
                            width = 0.45,
                            relative = "editor",
                            full_height = true, -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
                            sticky = false, -- when set to true and `layout` is not `"buffer"`, the chat buffer will remain opened when switching tabs
                            opts = {
                                breakindent = true,
                                cursorcolumn = false,
                                cursorline = false,
                                foldcolumn = "0",
                                linebreak = true,
                                list = false,
                                numberwidth = 1,
                                signcolumn = "no",
                                spell = false,
                                wrap = true,
                            },
                        },
                    },
                },
            })
        end
    }
}
