;;; $DOOMDIR/modules/baosize/blink-search/config.el -*- lexical-binding: t; -*-
(add-to-list 'load-path "~/.emacs.d/.local/straight/repos/blink-search/")
(use-package! blink-search
  :custom
  (blink-search-enable-posframe t)
  :config
  (add-hook! 'blink-search-mode-hook (meow-insert-mode))
  :bind (:map doom-leader-map
            ("RET" ("Blink search" . blink-search))))
