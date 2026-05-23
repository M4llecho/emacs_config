# Emacs Configuration

Configurazione personale in stile **literate** — tutta la logica vive in `config.org`,
che viene tanglato da `init.el` all'avvio. Ogni sezione è documentata direttamente nel file.

## Struttura

```
~/.emacs.d/
├── init.el          # Bootstrap: archivi pacchetti + tangle di config.org
├── config.org       # Configurazione completa (literate)
└── saves/
    ├── backups/     # Backup automatici (creata all'avvio)
    └── auto-saves/  # Auto-save (creata all'avvio)
```

## Requisiti

- **Emacs 29+** — richiesto per eglot built-in e tree-sitter
- **[Iosevka](https://typeof.net/Iosevka/)** — font principale (opzionale, ricade sul default se assente)
- **[libvterm](https://github.com/neovim/libvterm)** — richiesta per compilare vterm
- **[ripgrep](https://github.com/BurntSushi/ripgrep)** — richiesto per `consult-ripgrep`

Per i language server (LSP via eglot) installa separatamente:

```bash
pip install pyright          # Python
apt install clangd           # C/C++
```

## Installazione

```bash
git clone <repo> ~/.emacs.d
emacs
```

Al primo avvio Emacs scarica e installa tutti i pacchetti automaticamente.
Dopo l'installazione, esegui una volta:

```
M-x nerd-icons-install-fonts
M-x treesit-auto-install-all
```

## Pacchetti

### Core & Editing
Tutti built-in, zero dipendenze esterne.

| Funzione | Scopo |
|---|---|
| `display-line-numbers-mode` | Numeri di riga in `prog-mode` |
| `hl-line-mode` | Evidenzia riga corrente in `prog-mode` e `org-mode` |
| `electric-pair-mode` | Chiusura automatica parentesi e virgolette |
| `show-paren-mode` | Evidenzia parentesi corrispondente |
| `delete-selection-mode` | Digita sopra una selezione per sostituirla |

### Aspetto

| Pacchetto | Scopo |
|---|---|
| [doom-themes](https://github.com/doomemacs/themes) | Tema `doom-one` |
| [doom-modeline](https://github.com/seagle0128/doom-modeline) | Modeline con icone e info Git/LSP |
| [nerd-icons](https://github.com/rainstormstudio/nerd-icons.el) | Font di icone per modeline e dired |
| [beacon](https://github.com/Malabarba/beacon) | Flash cursore dopo scroll/cambio buffer |

### Minibuffer & Completamento

Stack basato sulle API standard di Emacs (`completing-read`, CAPF) — nessun framework proprietario.

| Pacchetto | Scopo |
|---|---|
| [vertico](https://github.com/minad/vertico) | UI verticale per il minibuffer |
| [orderless](https://github.com/oantolin/orderless) | Matching fuzzy multi-termine |
| [marginalia](https://github.com/minad/marginalia) | Annotazioni contestuali nei candidati |
| [consult](https://github.com/minad/consult) | Comandi di ricerca e navigazione live |
| [embark](https://github.com/oantolin/embark) | Azioni contestuali su qualsiasi oggetto |
| [embark-consult](https://github.com/oantolin/embark) | Bridge embark ↔ consult |
| [wgrep](https://github.com/mhayashi1120/Emacs-wgrep) | Buffer grep modificabile |
| [corfu](https://github.com/minad/corfu) | Completamento inline nel buffer |
| [cape](https://github.com/minad/cape) | Backend CAPF: dabbrev, file, keyword |
| [which-key](https://github.com/justbur/emacs-which-key) | Popup bind disponibili dopo prefisso |

### Org Mode

| Pacchetto | Scopo |
|---|---|
| [org-modern](https://github.com/minad/org-modern) | Bullets e liste con simboli Unicode |
| [org-appear](https://github.com/awth13/org-appear) | Mostra marker di enfasi al passaggio cursore |
| [toc-org](https://github.com/snosov1/toc-org) | TOC automatico aggiornato al salvataggio |
| [olivetti](https://github.com/rnkn/olivetti) | Scrittura centrata con margini laterali |
| [ox-gfm](https://github.com/larstvei/ox-gfm) | Esportatore org → GitHub Flavored Markdown |
| [ox-qmd](https://github.com/akawashiro/ox-qmd) | Esportatore org → Qiita Markdown |

Babel attivo per: `emacs-lisp`, `python`, `C`, `shell`.

### Sviluppo & LSP

| Pacchetto | Scopo |
|---|---|
| [treesit-auto](https://github.com/renzmann/treesit-auto) | Rimappa i major mode ai corrispettivi `*-ts-mode` |
| eglot (built-in) | Client LSP — attivo su C e Python |
| [yasnippet](https://github.com/joaotavora/yasnippet) | Snippet espandibili con TAB |
| [yasnippet-snippets](https://github.com/AndreaCrotti/yasnippet-snippets) | Collezione snippet per linguaggi comuni |
| [magit](https://magit.vc) | Interfaccia Git |
| [restclient](https://github.com/pashky/restclient.el) | Client HTTP per file `.http` / `.rest` |

### Terminale

| Pacchetto | Scopo |
|---|---|
| [vterm](https://github.com/akermu/emacs-libvterm) | Terminale ANSI completo via libvterm |
| [vterm-toggle](https://github.com/jixiuf/vterm-toggle) | Toggle terminale fisso in basso (30% altezza) |
| [multi-vterm](https://github.com/suonlight/multi-vterm) | Sessioni vterm multiple |

## Keybindings principali

| Bind | Comando |
|---|---|
| `C-x b` | `consult-buffer` — switcher buffer |
| `C-s` | `consult-line` — ricerca live nel buffer |
| `C-c s` | `consult-ripgrep` — ricerca nel progetto |
| `C-.` | `embark-act` — menu azioni contestuale |
| `C-;` | `embark-dwim` — azione principale senza menu |
| `C-x g` | `magit-status` |
| `C-c g b` | `magit-blame` |
| `C-c t` | `vterm-toggle` |
| `C-c T` | `vterm-toggle-cd` — terminale nella dir corrente |
| `C-c v c` | `multi-vterm` — nuova sessione terminale |
| `C-c r` | `rename-buffer` |

## Note

Il `custom-file` è rediretto a `custom.el` (non tracciato) per evitare che Emacs
sovrascriva `init.el` con variabili auto-generate.

`embark` ed `embark-consult` sono pinnati su GNU ELPA (`:pin gnu`) per aggirare
un bug ricorrente nei build MELPA.
