;;; $DOOMDIR/modules/baosize/blink-search/config.el -*- lexical-binding: t; -*-
(add-to-list 'load-path "~/.emacs.d/.local/straight/repos/blink-search/")
(setq blink-search-enable-posframe t)
(bind-key "C-M-g" 'blink-search)
(after! blink-search (add-hook! 'blink-search-mode-hook (meow-insert)))
