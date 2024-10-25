return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.solargraph.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.jdtls.setup({
        capabilities = capabilities,
      })

      lspconfig.csharp_ls.setup({
       	cmd = { "/home/neske99/.local/share/nvim/mason/packages/csharp-language-server/csharp-ls"  },
        capabilities = capabilities,
        enable_roslyn_analysers = true,
      	enable_import_completion = true,
      	organize_imports_on_format = true,
      	enable_decompilation_support = true,
      	filetypes = { "cs", "vb", "csproj", "sln", "slnx", "props", "csx", "targets" },

      })

      -- lspconfig.omnisharp.setup({
      -- 	cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
      -- 	capabilities = capabilities,
      -- 	enable_roslyn_analysers = true,
      -- 	enable_import_completion = true,
      -- 	organize_imports_on_format = true,
      -- 	enable_decompilation_support = true,
      -- 	filetypes = { "cs", "vb", "csproj", "sln", "slnx", "props", "csx", "targets" },
      -- })
      
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
