;;; baosize/tools/config.el -*- lexical-binding: t; -*-
(use-package paren
  :defer t
  :custom-face (show-paren-match ((t (:foreground "SpringGreen3" :underline t :weight bold))))
  :config
  (setq show-paren-when-point-inside-paren t
        show-paren-when-point-in-periphery t
        show-paren-context-when-offscreen t))
(when (modulep! :tools lsp)
  (add-hook 'lsp-mode-hook #'lsp-headerline-breadcrumb-mode))
(display-time-mode)
(fset 'yes-or-no-p 'y-or-n-p)
(global-subword-mode 1)
