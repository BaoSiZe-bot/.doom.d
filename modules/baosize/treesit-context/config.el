;;; $DOOMDIR/modules/baosize/treesit-context    /config.el -*- lexical-binding: t; -*-
(use-package! treesit-context
    :load-path "~/.doom.d/modules/baosize/treesit-context/"
    :hook
    (c++-ts-mode . treesit-context))
