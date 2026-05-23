;; Isola le variabili scritte da Custom in un file separato
;; per evitare che sovrascriva il config scritto a mano
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))

;; Inizializza il sistema di pacchetti
(require 'package)

;; Repository: GNU (stabile), NonGNU (semi-stabile), MELPA (bleeding edge)
(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))

(package-initialize)

;; Carica ed esegue il tangle di config.org
;; Tutto il resto della configurazione sta lì
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))
