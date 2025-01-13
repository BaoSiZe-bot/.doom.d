;;; $DOOMDIR/modules/baosize/treesit-context    /config.el -*- lexical-binding: t; -*-
(use-package! treesitter-context
    :hook
    (c++-ts-mode . treesitter-context-mode))
