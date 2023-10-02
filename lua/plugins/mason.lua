return {
    "williamboman/mason.nvim",
    dependencies =  {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("mason").setup({
            automatic_installation = true,
            -- 自动安装 Language Servers
            -- ensure_installed = {},
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },

            max_concurrent_installers = 10,
        })

        local lspconfig = require('lspconfig')

        local servers = {
            "clangd",
            "cmake",
            "lua_ls",
            "tsserver",
            "tailwindcss",
            "bashls",
            "cssls",
            "dockerls",
            "emmet_ls",
            "html",
            "jsonls",
            "pyright",
            "rust_analyzer",
            "taplo",
            "yamlls",
            "gopls",
        }

        require("mason-lspconfig").setup({
            -- 确保安装，根据需要填写
            ensure_installed = servers,
        })
        for _, server in ipairs(servers) do
            lspconfig[server].setup {}
        end
        -- require("lspconfig").rust_analyzer.setup {}
        -- require("lspconfig").clangd.setup {}
    end,
}
