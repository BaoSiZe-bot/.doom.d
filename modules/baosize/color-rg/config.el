;;; $DOOMDIR/modules/baosize/color-rg/config.el -*- lexical-binding: t; -*-
(require 'color-rg)
(bind-keys ("C-c r i" . color-rg-search-input)
           ("C-c r s" . color-rg-search-symbol)
           ("C-c r I" . color-rg-search-input-in-project)
           ("C-c r S" . color-rg-search-symbol-in-project)
           ("C-c r b" . color-rg-search-input-in-current-file)
           ("C-c r j" . color-rg-search-symbol-in-current-file)
           ("C-c r t" . color-rg-search-project-with-type)
           ("C-c r x" . color-rg-search-symbol-with-type))
