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

## Keybindings

### Navigazione e ricerca

| Bind | Comando | Note |
|---|---|---|
| `C-x b` | `consult-buffer` | Switcher buffer con preview live |
| `C-s` | `consult-line` | Ricerca nel buffer corrente con preview |
| `C-c s` | `consult-ripgrep` | Ripgrep nel progetto con preview |
| `C-.` | `embark-act` | Menu azioni contestuale sull'oggetto sotto il cursore |
| `C-;` | `embark-dwim` | Azione principale senza aprire il menu |
| `C-h B` | `embark-bindings` | Mostra tutti i bind attivi nel contesto corrente |
| `C-n` / `C-p` | vertico: candidato successivo/precedente | Anche frecce |
| `M-A` | marginalia: cicla livello annotazioni | Più/meno dettaglio nei candidati |

### Editing in wgrep

| Bind | Comando |
|---|---|
| `C-c C-p` | Rende il buffer grep modificabile |
| `C-c C-c` | Salva tutte le modifiche nei file originali |
| `C-c C-k` | Annulla tutte le modifiche in sospeso |
| `C-c C-d` | Marca una riga per la cancellazione |

### Completamento (corfu)

| Bind | Azione |
|---|---|
| `TAB` / `M-TAB` | Completa o cicla tra i candidati |
| `RET` | Accetta il candidato selezionato |
| `ESC` / `C-g` | Chiude il popup |
| `M-n` / `M-p` | Scorre la documentazione inline del candidato |
| `M-.` | Vai alla definizione dal popup |
| `C-h` | Mostra documentazione del candidato |

### LSP / eglot

| Bind | Comando | Note |
|---|---|---|
| `M-.` | `xref-find-definitions` | Vai alla definizione |
| `M-,` | `xref-pop-marker-stack` | Torna alla posizione precedente |
| `M-?` | `xref-find-references` | Trova tutti i riferimenti |
| `C-c C-r` | `eglot-rename` | Rinomina simbolo in tutto il progetto |
| `C-c C-a` | `eglot-code-actions` | Azioni LSP contestuali (import, fix, ecc.) |
| `C-c C-f` | `eglot-format` | Formatta buffer o regione selezionata |
| `M-n` / `M-p` | `flymake-goto-next/prev-error` | Naviga tra i diagnostics |

### Yasnippet

| Bind | Azione |
|---|---|
| `TAB` | Espandi snippet o salta al campo successivo |
| `S-TAB` | Torna al campo precedente |
| `M-x yas-describe-tables` | Elenca tutti gli snippet del major-mode corrente |

### Org Mode

| Bind | Azione |
|---|---|
| `TAB` | Cicla visibilità heading: chiuso → figli → tutto |
| `S-TAB` | Cicla visibilità globale dell'intero documento |
| `M-RET` | Inserisce heading/item allo stesso livello |
| `M-↑` / `M-↓` | Sposta heading su/giù tra i fratelli |
| `M-←` / `M-→` | Promuovi/declassa heading di un livello |
| `C-c C-c` | Esegui src block / aggiorna tabella / conferma |
| `C-c '` | Apri src block in buffer dedicato con il major-mode del linguaggio |
| `C-c C-e` | Menu di esportazione |
| `C-c C-l` | Inserisci o modifica un link |
| `C-c C-o` | Apri link sotto il cursore |
| `C-c C-t` | Cicla stato TODO dell'heading |
| `< s TAB` | Espandi template `#+begin_src` (org-tempo) |
| `< e TAB` | Espandi template `#+begin_example` |
| `< q TAB` | Espandi template `#+begin_quote` |

### Magit

`C-x g` apre il buffer status. Tutti i bind seguenti funzionano al suo interno.

| Bind | Azione |
|---|---|
| `C-x g` | `magit-status` — apre il buffer principale |
| `C-c g b` | `magit-blame` — blame inline riga per riga |
| `TAB` | Espandi/collassa sezione o hunk |
| `s` / `u` | Stage / unstage file o hunk |
| `c c` | Commit (apre buffer per il messaggio, `C-c C-c` per confermare) |
| `P p` | Push al remote corrente |
| `F p` | Pull dal remote corrente |
| `b b` | Cambia branch con completamento |
| `b c` | Crea nuovo branch |
| `l l` | Log del branch corrente |
| `d d` | Diff del file o hunk sotto il cursore |
| `z z` | Stash delle modifiche correnti |
| `z p` | Pop dello stash |
| `r i` | Rebase interattivo |
| `?` | Help contestuale — mostra tutti i bind disponibili |
| `q` | Chiudi il buffer magit corrente |

### Terminale

| Bind | Comando | Note |
|---|---|---|
| `C-c t` | `vterm-toggle` | Apri/chiudi terminale fisso in basso (30% altezza) |
| `C-c T` | `vterm-toggle-cd` | Come sopra, nella directory del buffer corrente |
| `C-c v c` | `multi-vterm` | Nuova sessione terminale indipendente |
| `C-c r` | `rename-buffer` | Rinomina la sessione terminale corrente |
| `C-c C-c` | Invia SIGINT al processo | Equivalente di `Ctrl+C` nel terminale |

---

## Workflow

### Ricerca e modifica massiva su più file

Il flusso più potente della configurazione — refactoring o rinomina di stringhe
non gestita da LSP, aggiornamento di configurazioni, pulizia di log.

```
C-c s        →  consult-ripgrep: cerca il pattern nel progetto
                (filtra con orderless mentre scrivi: "foo bar" cerca entrambi in ordine libero)
C-. → E      →  embark-export: esporta i risultati in un buffer grep
C-c C-p      →  wgrep: rende il buffer modificabile
                (modifica le righe direttamente come in un file normale)
C-c C-c      →  wgrep: salva tutte le modifiche nei file originali
```

### Sviluppo con LSP

Ciclo tipico su un file Python o C con eglot attivo e language server installato.

```
M-.          →  vai alla definizione del simbolo sotto il cursore
M-,          →  torna alla posizione precedente
M-?          →  trova tutti i riferimenti nel progetto
C-c C-a      →  apri le code actions (fix import mancante, genera stub, ecc.)
C-c C-r      →  rinomina il simbolo in tutti i file del progetto
C-c C-f      →  formatta il buffer con il formatter del language server
M-n / M-p    →  naviga tra gli errori segnalati da flymake
```

### Commit Git

```
C-x g        →  magit-status: panoramica del repository
TAB          →  espandi un hunk per vedere le modifiche nel dettaglio
s            →  stage del file o del singolo hunk selezionato
c c          →  apri buffer per il messaggio di commit
C-c C-c      →  conferma il commit
P p          →  push al remote
```

Per un rebase interattivo sugli ultimi N commit: da magit-status `r i`,
poi seleziona il commit di base.

### Testing API REST

Crea un file con estensione `.http`, scrivi le richieste in formato leggibile.
Ogni richiesta è separata da `###`.

```http
GET https://api.example.com/users
Authorization: Bearer {{token}}

###

POST https://api.example.com/users
Content-Type: application/json

{"name": "Nicolò", "role": "admin"}
```

```
C-c C-c      →  esegui la richiesta sotto il cursore
                (la risposta appare in un buffer separato con syntax highlighting)
C-c C-v      →  esegui senza spostarti dal file
C-c n n      →  salta alla richiesta successiva
```

### Docs-as-code con Org e Babel

Scrivi documentazione e codice nello stesso file `.org`. I src block sono
eseguibili e il risultato può essere inserito automaticamente nel documento.

```
< s TAB      →  inserisci un src block con template
C-c '        →  apri il src block in un buffer dedicato con il major-mode corretto
                (chiudi con C-c C-c per tornare al file org)
C-c C-c      →  esegui il src block e inserisci il risultato come #+RESULTS
C-c C-e g g  →  esporta l'intero documento in GitHub Flavored Markdown
C-c C-e h h  →  esporta in HTML
```

Il config stesso (`config.org`) usa questo approccio: viene tanglato in Elisp
all'avvio tramite `org-babel-load-file` in `init.el`. Per modificare la
configurazione basta editare `config.org` e riavviare Emacs.

### Gestione sessioni terminale

Workflow consigliato per progetti con più processi attivi contemporaneamente.

```
C-c t        →  apri il terminale principale in basso (server, watcher, ecc.)
C-c v c      →  crea una seconda sessione per comandi veloci
C-c r        →  rinomina le sessioni con nomi significativi ("backend", "db", ecc.)
C-x b        →  consult-buffer: switcha tra sessioni
                (il filtro avviene per nome, scrivi direttamente il nome della sessione)
C-c T        →  apri un terminale direttamente nella directory del progetto corrente
```

---

## Note

Il `custom-file` è rediretto a `custom.el` (non tracciato) per evitare che Emacs
sovrascriva `init.el` con variabili auto-generate.

`embark` ed `embark-consult` sono pinnati su GNU ELPA (`:pin gnu`) per aggirare
un bug ricorrente nei build MELPA.
