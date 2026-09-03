return {
  -- Ícones usados por vários plugins (precisa de uma Nerd Font no terminal)
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Menu de atalhos que aparece na tela quando você aperta espaço (ou espera um pouco)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.add({
        { "<leader>f", group = "Buscar" },
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Buscar arquivo" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Buscar texto no projeto" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buscar entre abas abertas" },
        { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Arquivos recentes" },
        { "<leader>fc", "<cmd>Telescope commands<CR>", desc = "Paleta de comandos" },
        { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Ajuda" },

        { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Explorador de arquivos" },

        { "<leader>b", group = "Abas" },
        { "<leader>bd", "<cmd>bdelete<CR>", desc = "Fechar aba" },
        { "<leader>bn", "<cmd>bnext<CR>", desc = "Próxima aba" },
        { "<leader>bp", "<cmd>bprevious<CR>", desc = "Aba anterior" },

        { "<leader>w", group = "Janela" },
        { "<leader>wv", "<C-w>v", desc = "Dividir na vertical" },
        { "<leader>ws", "<C-w>s", desc = "Dividir na horizontal" },
        { "<leader>wc", "<C-w>c", desc = "Fechar janela" },

        { "<leader>g", group = "Git" },
        { "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Ver alteração" },
        { "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Desfazer alteração" },
        { "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Marcar alteração (stage)" },
        { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Mostrar quem alterou a linha" },

        { "<leader>c", group = "Código" },
        { "<leader>ca", vim.lsp.buf.code_action, desc = "Ações de código" },
        { "<leader>cr", vim.lsp.buf.rename, desc = "Renomear símbolo" },
        { "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, desc = "Formatar arquivo" },
        { "<leader>cd", vim.diagnostic.open_float, desc = "Ver erro/aviso na linha" },

        { "<leader>t", "<cmd>ToggleTerm<CR>", desc = "Terminal" },
        { "<leader>q", "<cmd>confirm qa<CR>", desc = "Sair do Neovim" },
        { "<leader>s", "<cmd>write<CR>", desc = "Salvar" },
      })
    end,
  },

  -- Barra de status embaixo, mostrando modo, arquivo, git, erros etc.
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = { theme = "tokyonight", globalstatus = true },
    },
  },

  -- Abas em cima, igual VSCode
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {
      options = {
        mode = "buffers",
        show_buffer_close_icons = true,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
        offsets = {
          { filetype = "neo-tree", text = "Explorador", highlight = "Directory", text_align = "left" },
        },
      },
    },
  },

  -- Guias de indentação (linhas verticais), igual VSCode
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    opts = {},
  },

  -- Tela inicial com atalhos rápidos, tipo a tela de boas-vindas de qualquer editor
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
        "                                                    ",
        "   ███╗   ██╗██╗   ██╗██╗███╗   ███╗                ",
        "   ████╗  ██║██║   ██║██║████╗ ████║                ",
        "   ██╔██╗ ██║██║   ██║██║██╔████╔██║                ",
        "   ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║                ",
        "   ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║                ",
        "   ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝                ",
        "                                                    ",
      }
      dashboard.section.buttons.val = {
        dashboard.button("p", "  Buscar arquivo (Ctrl+P)", "<cmd>Telescope find_files<CR>"),
        dashboard.button("r", "  Arquivos recentes", "<cmd>Telescope oldfiles<CR>"),
        dashboard.button("g", "  Buscar texto no projeto", "<cmd>Telescope live_grep<CR>"),
        dashboard.button("e", "  Explorador de arquivos (Ctrl+B)", "<cmd>Neotree toggle<CR>"),
        dashboard.button("n", "  Novo arquivo", "<cmd>enew<CR>"),
        dashboard.button("q", "  Sair", "<cmd>confirm qa<CR>"),
      }
      dashboard.section.footer.val = { "Espaço = menu de atalhos  |  :help para ajuda do Neovim" }
      require("alpha").setup(dashboard.config)
    end,
  },
}
