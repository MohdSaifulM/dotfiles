return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require("nvim-treesitter").install({
                "lua", "vim", "vimdoc", "query",
                "markdown", "markdown_inline",
                "javascript", "typescript", "tsx",
                "html", "css", "json", "bash",
            })

            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local lang = vim.treesitter.language.get_lang(args.match) or args.match
                    local ok = pcall(vim.treesitter.start)
                    if ok then
                        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    elseif vim.tbl_contains(require("nvim-treesitter").get_available(1), lang) then
                        require("nvim-treesitter").install({ lang })
                    end
                end,
            })
        end
    }
}
