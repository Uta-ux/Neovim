local o = vim.opt

-- Mouse ligado, igual num editor gráfico: dá pra clicar, selecionar, redimensionar
o.mouse = "a"

-- Área de transferência do sistema compartilhada (Ctrl+C / Ctrl+V funcionam entre nvim e o resto do PC)
o.clipboard = "unnamedplus"

-- Visual
o.number = true
o.relativenumber = false
o.cursorline = true
o.termguicolors = true
o.signcolumn = "yes"
o.wrap = false
o.scrolloff = 8
o.splitright = true
o.splitbelow = true

-- Indentação
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.smartindent = true

-- Busca
o.ignorecase = true
o.smartcase = true

-- Deixa o which-key (menu de atalhos) aparecer rápido
o.timeoutlen = 400
o.updatetime = 250

-- Desfazer mesmo depois de fechar o arquivo
o.undofile = true

-- Sem arquivos de swap/backup poluindo as pastas
o.swapfile = false
o.backup = false

o.completeopt = { "menu", "menuone", "noselect" }
