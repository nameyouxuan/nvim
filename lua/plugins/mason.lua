return {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
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
                "lua_ls",
                "sumneko_lua",
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
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "mason")
      require("mason").setup(opts)

      -- custom nvchad cmd to install all mason binaries listed
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
      end, {})

      vim.g.mason_binaries_list = opts.ensure_installed
    end,
}
