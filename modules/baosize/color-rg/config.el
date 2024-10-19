;;; $DOOMDIR/modules/baosize/color-rg/config.el -*- lexical-binding: t; -*-
(use-package! color-rg
  :config
  (add-hook! 'color-rg-mode-hook (meow-insert-mode))
  :bind (:map doom-leader-map
        ("ri" ("ripgrep input" . color-rg-search-input))
        ("rs" ("ripgrep current symbol" . color-rg-search-symbol))
        ("rI" ("ripgrep current input in project" . color-rg-search-input-in-project))
        ("rS" ("ripgrep current symbol in project" . color-rg-search-symbol-in-project))
        ("rb" ("ripgrep input in buffer" . color-rg-search-input-in-current-file))
        ("rj" ("ripgrep current symbol in current file" . color-rg-search-symbol-in-current-file))
        ("rt" ("ripgrep input in buffer with same extentions" . color-rg-search-project-with-type))
        ("rx" ("ripgrep current symbol with same extentions" . color-rg-search-symbol-with-type))))
