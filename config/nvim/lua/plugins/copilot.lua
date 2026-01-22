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
    -- {
    --     'github/copilot.vim',
    --     config = function()
    --         vim.keymap.set('n', '<leader>cp', ':copilot panel<cr>')
    --
    --         -- vim.keymap.set('i', '<c-c>', 'copilot#accept("\\<cr>")', {
    --         vim.keymap.set('i', '<tab>', 'copilot#accept("\\<tab>")', {
    --             expr = true,
    --             replace_keycodes = false
    --         })
    --         vim.g.copilot_no_tab_map = true
    --     end
    -- },
    -- 

    -- {
    --  "Exafunction/codeium.nvim",
    --  dependencies = {
    --      "nvim-lua/plenary.nvim",
    --      "hrsh7th/nvim-cmp",
    --  },
    --  config = function()
    --      require("codeium").setup({})
    --  end,
    -- },
    --
    -- {
    --  "Exafunction/codeium.vim",
    --  event = "BufEnter",
    --  config = function()
    --      -- Add keybindings for Codeium functions here
    --      vim.keymap.set("i", "<C-g>", function()
    --          return vim.fn["codeium#Accept"]()
    --      end, { expr = true, silent = true })
    --      vim.keymap.set("i", "<C-c>", function()
    --          return vim.fn["codeium#CycleCompletions"](1)
    --      end, { expr = true, silent = true })
    --      vim.keymap.set("i", "<C-v>", function()
    --          return vim.fn["codeium#CycleCompletions"](-1)
    --      end, { expr = true, silent = true })
    --      vim.keymap.set("i", "<C-x>", function()
    --          return vim.fn["codeium#Clear"]()
    --      end, { expr = true, silent = true })
    --  end,
    -- },
    -- {
    --  "robitx/gp.nvim",
    --  config = function()
    --      local conf = {
    --          -- For customization, refer to Install > Configuration in the Documentation/Readme
    --      }
    --      require("gp").setup(conf)
    --
    --      -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    --  end,
    -- },

    -- {
    --     "yetone/avante.nvim",
    --     event = "VeryLazy",
    --     lazy = false,
    --     version = false, -- set this if you want to always pull the latest change
    --     opts = {
    --         -- provider = "openai",
    --         -- providers = { "openai" },
    --         -- openai = {
    --         --  model = "gpt-3.5-turbo",
    --         -- model = "gpt-3.5-turbo-0125",
    --         -- model = "gpt-4-turbo",
    --         --  temperature = 0.3,
    --         --  max_tokens = 1000,
    --         -- },
    --         -- provider = "claude",
    --         -- providers = { "claude" },
    --         -- claude = {
    --         --     endpoint = "https://api.anthropic.com",
    --         --     model = "claude-3-5-sonnet-20241022",
    --         --     temperature = 0,
    --         --     max_tokens = 4096,
    --         -- },
    --         provider = "copilot",
    --         -- auto_suggestions_provider = "copilot",
    --
    --         windows = {
    --             position = "right",
    --         },
    --     },
    --
    --     -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    --
    --     build = "make",
    --     -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter",
    --         "stevearc/dressing.nvim",
    --         "nvim-lua/plenary.nvim",
    --         "MunifTanjim/nui.nvim",
    --         --- The below dependencies are optional,
    --         "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    --         "zbirenbaum/copilot.lua",      -- for providers='copilot'
    --         -- {
    --         --     -- support for image pasting
    --         --     "HakonHarnes/img-clip.nvim",
    --         --     event = "VeryLazy",
    --         --     opts = {
    --         --         -- recommended settings
    --         --         default = {
    --         --             embed_image_as_base64 = false,
    --         --             prompt_for_file_name = false,
    --         --             drag_and_drop = {
    --         --                 insert_mode = true,
    --         --             },
    --         --             -- required for Windows users
    --         --             use_absolute_path = true,
    --         --         },
    --         --     },
    --         -- },
    --         -- {
    --             -- Make sure to set this up properly if you have lazy=true
    --             -- "MeanderingProgrammer/render-markdown.nvim",
    --             -- opts = {
    --             --     file_types = { "markdown", "Avante" },
    --             -- },
    --             -- ft = { "markdown", "Avante" },
    --             -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    --             -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    --             -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    --         -- },
    --     },
    -- },
}
