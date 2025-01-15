;;; $DOOMDIR/modules/baosize/blink-search/config.el -*- lexical-binding: t; -*-
(use-package blink-search
  :load-path "~/.emacs.d/.local/straight/repos/blink-search/"
  :bind
  (("C-M-g" . blink-search))
  :config
  (add-hook 'blink-search-mode-hook #'meow-insert))
