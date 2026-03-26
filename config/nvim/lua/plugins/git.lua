return {
    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
        config = function()
            vim.keymap.set("n", "<leader>gs", ":vert Git<CR>")
            vim.keymap.set("n", "<leader>gd", vim.cmd.Gvdiff)
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup({
                current_line_blame = false,
            })

            vim.keymap.set("n", "<leader>hp", ":Gitsigns preview_hunk<CR>")
            vim.keymap.set("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
            vim.keymap.set("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>")
            vim.keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
            vim.keymap.set("n", "<leader>hb", ":Gitsigns blame_line<CR>")
            vim.keymap.set("n", "]c", ":Gitsigns next_hunk<CR>")
            vim.keymap.set("n", "[c", ":Gitsigns prev_hunk<CR>")
        end,
    },
}
