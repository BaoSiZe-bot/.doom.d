;;; baosize/lsp-bridge/config.el -*- lexical-binding: t; -*-

(use-package! lsp-bridge
  :hook (prog-mode . global-lsp-bridge-mode)
  :custom
  (lsp-bridge-enable-hover-diagnostic t)
  (acm-backend-preview t)
  (lsp-bridge-symbols-enable-which-func t)
  (lsp-bridge-enable-inlay-hint t)
  (lsp-bridge-python-multi-lsp-server "pyright-background-analysis_ruff")
  :config
  (use-package! yasnippet
  :config
  (yas-global-mode))
  (map! :map doom-leader-code-map
        :desc "LSP Rename"
        "r"             #'lsp-bridge-rename
        :desc "LSP Action"
        "a"             #'lsp-bridge-code-action
        :desc "LSP Diagnostic"
        "d"             #'lsp-bridge-diagnostic-list
        :desc "LSP Find declaration"
        "j"             #'lsp-bridge-find-def)
;;  (setq lsp-bridge-use-wenls-in-org-mode 't)
  (add-hook! 'lsp-bridge-ref-mode-hook (evil-emacs-state))
  (global-lsp-bridge-mode))

(unless (display-graphic-p)
  (after! acm
    (use-package! acm-terminal)))
