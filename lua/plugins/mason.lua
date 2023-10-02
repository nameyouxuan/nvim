return {
    "williamboman/mason.nvim",
    dependencies =  {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
            max_concurrent_installers = 10,
        })

        require("mason-lspconfig").setup({
            -- 自动安装 Language Servers
            automatic_installation = true,
            -- 确保安装，根据需要填写
            ensure_installed = {
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
            },
        })
    end,
}
