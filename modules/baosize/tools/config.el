;;; baosize/tools/config.el -*- lexical-binding: t; -*-
;; Automatically save file content

(use-package keyfreq
  :defer t
  :hook (doom-first-input . keyfreq-mode)
        (doom-first-input . keyfreq-autosave-mode))
(use-package paren
  :defer t
  :custom-face (show-paren-match ((t (:foreground "SpringGreen3" :underline t :weight bold))))
  :config
  (setq show-paren-when-point-inside-paren t
        show-paren-when-point-in-periphery t
        show-paren-context-when-offscreen t))
(use-package colorful-mode
  :defer t
  :hook (prog-mode text-mode))

    ;; (add-hook 'prog-mode-hook #'symbol-overlay-mode)
    ;; (add-hook 'text-mode-hook #'symbol-overlay-mode)

(if (modulep! :tools lsp)
  (add-hook 'lsp-mode-hook #'lsp-headerline-breadcrumb-mode))

(display-time-mode)
(fset 'yes-or-no-p 'y-or-n-p)
(global-subword-mode 1)
