;;; baosize/lsp-bridge/config.el -*- lexical-binding: t; -*-

(use-package! yasnippet
  :hook (prog-mode . yas-global-mode))
(use-package! lsp-bridge
  :hook
  (prog-mode . global-lsp-bridge-mode)
  :config
  (setq lsp-bridge-enable-hover-diagnostic t)
  (setq lsp-bridge-symbols-enable-which-func t)
  (setq lsp-bridge-enable-inlay-hint t)
  (setq lsp-bridge-enable-log nil)
  (setq lsp-bridge-enable-search-words nil)
  (setq acm-enable-search-file-words nil)
  (setq lsp-bridge-python-multi-lsp-server "pylsp_ruff")
  (setq lsp-workspace-symbol-candidates -1)
  (setq acm-backend-lsp-workspace-symbol-server-names -1)
  (map! :map doom-leader-code-map
        :desc "LSP Rename"
        "r"             #'lsp-bridge-rename
        :desc "LSP Action"
        "a"             #'lsp-bridge-code-action
        :desc "LSP Diagnostic"
        "d"             #'lsp-bridge-diagnostic-list
        :desc "LSP Find declaration"
        "j"             #'lsp-bridge-find-def
        :desc "Lsp Format"
        "f"             #'lsp-bridge-code-format)
  (add-hook! 'lsp-bridge-ref-mode-hook (evil-emacs-state)))

(unless (display-graphic-p)
  (after! acm
    (use-package! acm-terminal)))
