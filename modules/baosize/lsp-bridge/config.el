;;; baosize/lsp-bridge/config.el -*- lexical-binding: t; -*-
(use-package! yasnippet
  :config
  (yas-global-mode 1))
(use-package! lsp-bridge
  :config
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
  (setq lsp-bridge-python-multi-lsp-server "pyright-background-analysis_ruff")
  (setq acm-enable-tempel nil)
  (setq lsp-bridge-enable-log nil)
  (global-lsp-bridge-mode))

(unless (display-graphic-p)
  (after! acm
    (use-package! acm-terminal)))
