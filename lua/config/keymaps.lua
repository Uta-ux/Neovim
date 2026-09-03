local map = vim.keymap.set

-- Ctrl+Z estava mapeado por padrão para "suspender" o Neovim; aqui vira Desfazer de verdade
map({ "n", "i" }, "<C-z>", "<Esc>u", { desc = "Desfazer" })
map({ "n", "i" }, "<C-y>", "<Esc><C-r>", { desc = "Refazer" })

-- Salvar com Ctrl+S em qualquer modo, como em qualquer editor normal
map({ "n", "i", "v" }, "<C-s>", "<Esc><cmd>write<CR>", { desc = "Salvar arquivo" })

-- Selecionar tudo
map({ "n", "i" }, "<C-a>", "<Esc>ggVG", { desc = "Selecionar tudo" })

-- Sair de um jeito rápido
map("n", "<C-q>", "<cmd>confirm qa<CR>", { desc = "Sair do Neovim" })

-- Buscar dentro do arquivo (parecido com Ctrl+F do VSCode)
map("n", "<C-f>", "/", { desc = "Buscar no arquivo" })

-- Comentar/descomentar linha (Ctrl+/, chega no terminal como Ctrl+_)
map("n", "<C-_>", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comentar/descomentar linha" })
map("v", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Comentar/descomentar seleção" })

-- Mover entre janelas com Ctrl+setas ou Ctrl+hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Ir para janela à esquerda" })
map("n", "<C-l>", "<C-w>l", { desc = "Ir para janela à direita" })
map("n", "<C-j>", "<C-w>j", { desc = "Ir para janela abaixo" })
map("n", "<C-k>", "<C-w>k", { desc = "Ir para janela acima" })

-- Mover linha(s) selecionada(s) para cima/baixo (Alt+seta, igual VSCode)
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Mover seleção para baixo" })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Mover seleção para cima" })
map("n", "<A-Down>", ":m .+1<CR>==", { desc = "Mover linha para baixo" })
map("n", "<A-Up>", ":m .-2<CR>==", { desc = "Mover linha para cima" })

-- Continua selecionado depois de indentar com < e >
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Explorador de arquivos (barra lateral, igual VSCode)
map("n", "<C-b>", "<cmd>Neotree toggle<CR>", { desc = "Mostrar/ocultar explorador de arquivos" })

-- Buscar arquivos pelo nome (Ctrl+P, igual VSCode)
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Buscar arquivo" })

-- Terminal integrado (Ctrl+\ abre/fecha, configurado em plugins/terminal.lua)
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Sair do modo terminal" })

-- Abas/buffers: Ctrl+Tab / Ctrl+Shift+Tab para navegar, como abas do navegador/VSCode
map("n", "<C-Tab>", "<cmd>bnext<CR>", { desc = "Próxima aba" })
map("n", "<C-S-Tab>", "<cmd>bprevious<CR>", { desc = "Aba anterior" })
map("n", "<C-w>", "<cmd>bdelete<CR>", { desc = "Fechar aba" })

-- Atalhos de LSP (código: ir para definição, renomear, corrigir)
map("n", "F12", vim.lsp.buf.definition, { desc = "Ir para definição" })
map("n", "F2", vim.lsp.buf.rename, { desc = "Renomear símbolo" })
map({ "n", "v" }, "<C-.>", vim.lsp.buf.code_action, { desc = "Ações de código" })

-- O menu de atalhos do <leader> (tecla de espaço) é registrado em
-- lua/plugins/ui.lua, dentro da configuração do which-key.nvim.
