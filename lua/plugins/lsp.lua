return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    opts = {
      ensure_installed = { "lua_ls", "pyright", "ts_ls", "bashls" },
    },
    config = function(_, opts)
      -- Todo servidor instalado ganha autocompletar rico (via blink.cmp)
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      require("mason-lspconfig").setup(opts)

      vim.diagnostic.config({
        virtual_text = { prefix = "●" },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = " ",
          },
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local map_opts = { buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, map_opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, map_opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, map_opts)
        end,
      })
    end,
  },
}
