;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/modules/baosize/dape/packages.el
(package! dape
  :recipe (:host github
           :repo "svaante/dape"
           :files ("*")))

(package! lsp-mode :disable t :ignore t)
(package! dap-mode :disable t :ignore t)
