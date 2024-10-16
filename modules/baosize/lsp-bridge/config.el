;;; baosize/lsp-bridge/config.el -*- lexical-binding: t; -*-

(use-package! yasnippet
  :hook
  (prog-mode . yas-minor-mode))
(use-package! lsp-bridge
  :hook
  (c++-ts-mode . lsp-bridge-mode)
  (python-ts-mode . lsp-bridge-mode)
  (emacs-lisp-mode . lsp-bridge-mode)
  (inferior-python-mode . lsp-bridge-mode)
  (inferior-emacs-lisp-mode . lsp-bridge-mode)
  :custom
  (lsp-bridge-symbols-enable-which-func t)
  (lsp-bridge-enable-inlay-hint t)
  (lsp-bridge-enable-log nil)
  (acm-enable-search-file-words nil)
  ;; (ac-enable-codeium t)
  (lsp-bridge-python-multi-lsp-server "pylsp_ruff")
  (acm-enable-lsp-workspace-symbol nil)
  :bind (:map doom-leader-code-map
         ("r" ("LSP rename" . lsp-bridge-rename))
         ("a" ("LSP action" . lsp-bridge-code-action))
         ("j" ("LSP find declaration" . lsp-bridge-find-def))
         ("f" ("Lsp format" . lsp-bridge-code-format)))
        (:map doom-leader-map
         ("dd" ("LSP diagnostic list" . lsp-bridge-diagnostic-list))
         ("dn" ("LSP diagnostic goto next" . lsp-bridge-diagnostic-jump-next))
         ("dp" ("LSP diagnostic previuos" . lsp-bridge-diagnostic-jump-prev))
         ("d]" ("LSP diagnostic goto next" . lsp-bridge-diagnostic-jump-next))
         ("d[" ("LSP diagnostic previuos" . lsp-bridge-diagnostic-jump-prev))
         ("dk" ("LSP Hover" . lsp-bridge-popup-documentation))))
