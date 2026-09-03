# Atalhos do seu Neovim (estilo VSCode)

Tecla mágica: aperte apenas **espaço** e espere um instante — vai aparecer um
menu na tela mostrando tudo que você pode fazer a partir dali. Isso vale para
qualquer atalho que comece com espaço abaixo.

## Essenciais

| Atalho              | O que faz                              |
|---------------------|-----------------------------------------|
| `Ctrl+S`             | Salvar                                  |
| `Ctrl+P`             | Buscar/abrir arquivo pelo nome          |
| `Ctrl+B`             | Mostrar/ocultar explorador de arquivos  |
| `Ctrl+\`             | Mostrar/ocultar terminal                |
| `Ctrl+F`             | Buscar dentro do arquivo atual          |
| `Ctrl+Z` / `Ctrl+Y`  | Desfazer / Refazer                      |
| `Ctrl+A`             | Selecionar tudo                         |
| `Ctrl+/`             | Comentar/descomentar linha              |
| `Ctrl+Tab` / `Ctrl+Shift+Tab` | Próxima aba / aba anterior     |
| `Ctrl+W`             | Fechar aba atual                        |
| `Ctrl+Q`             | Sair do Neovim                          |
| `Alt+↑` / `Alt+↓`    | Mover a linha (ou seleção) pra cima/baixo |
| `Ctrl+h/j/k/l`       | Pular entre janelas divididas           |

## Código (com o servidor de linguagem ligado)

| Atalho      | O que faz                     |
|-------------|--------------------------------|
| `F12`       | Ir para a definição            |
| `F2`        | Renomear símbolo               |
| `Ctrl+.`    | Ações de código (quick fix)    |
| `K`         | Mostrar documentação do símbolo|
| `gr`        | Ver onde algo é usado          |

Durante a digitação, sugestões aparecem sozinhas. `Ctrl+Espaço` força a lista
de sugestões, `Tab`/`Enter` aceita, `Ctrl+N`/`Ctrl+P` navega entre elas.

## Menu de espaço (`<leader>`)

Aperte `espaço` e depois:

- `f f` → buscar arquivo
- `f g` → buscar um texto em todo o projeto
- `f b` → listar abas abertas
- `f r` → arquivos recentes
- `f c` → paleta de comandos (estilo `Ctrl+Shift+P` do VSCode)
- `e`   → explorador de arquivos
- `b d` → fechar aba
- `w v` / `w s` → dividir janela na vertical/horizontal
- `g p` / `g s` / `g r` → ver / marcar / desfazer alteração do git na linha
- `c a` → ações de código
- `c f` → formatar o arquivo
- `t`   → terminal
- `s`   → salvar
- `q`   → sair

## Sobre os ícones

Os ícones do explorador de arquivos, das abas e do git precisam de uma
"Nerd Font" no terminal. Já instalei a fonte **JetBrainsMono Nerd Font** e
configurei o seu terminal (Ptyxis) para usá-la automaticamente. Se algum
ícone ainda aparecer como quadradinho, feche e abra o terminal de novo.

## Primeira abertura

Na primeira vez que você abrir o Neovim, ele vai baixar sozinho os plugins e
os "cérebros" de cada linguagem (chamados de LSP — para Lua, Python, JS/TS e
Bash já vêm prontos). Isso já foi feito uma vez durante a instalação, mas se
aparecer alguma mensagem de download, é normal, só esperar terminar.
