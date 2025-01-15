;;; $DOOMDIR/modules/baosize/sort-tab/config.el -*- lexical-binding: t; -*-
(use-package sort-tab
;;  :defer t
  :hook
  (doom-after-init . sort-tab-mode)
  :init
  (bind-keys ("C-c b]" . sort-tab-select-next-tab)
        ("C-c bn" . sort-tab-select-next-tab)
        ("C-c b[" . sort-tab-select-prev-tab)
        ("C-c bp" . sort-tab-select-prev-tab)
        ("C-c bl" . sort-tab-select-last-tab)
        ("C-c bK" . sort-tab-close-all-tabs)
        ("C-c bO" . sort-tab-close-other-tabs)
        ("C-c bd" . sort-tab-close-current-tab)
        ("C-c bk" . sort-tab-close-current-tab)))
