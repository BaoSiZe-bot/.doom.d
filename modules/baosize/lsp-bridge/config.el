;;; baosize/lsp-bridge/config.el -*- lexical-binding: t; -*-

(use-package! lsp-bridge
  :hook
  (prog-mode . lsp-bridge-mode)
  (markdown-mode . lsp-bridge-mode)
  (org-mode . lsp-bridge-mode)
  (inferior-python-mode . lsp-bridge-mode)
  (inferior-emacs-lisp-mode . lsp-bridge-mode)
  :custom
  (lsp-bridge-symbols-enable-which-func t)
  (lsp-bridge-enable-inlay-hint t)
  (lsp-bridge-enable-log nil)
  (acm-enable-search-file-words t)
  (lsp-bridge-enable-hover-diagnostic t)
  (lsp-bridge-signature-show-function 'lsp-bridge-signature-show-with-frame)
  (lsp-bridge-signature-show-with-frame-position 'point)
  ;; (acm-enable-codeium t)
  (lsp-bridge-python-multi-lsp-server "pylsp_ruff")
  (lsp-bridge-enable-mode-line nil)
  (acm-enable-lsp-workspace-symbol t)
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
         ("dk" ("LSP Hover" . lsp-bridge-popup-documentation)))
  :config
  (add-hook! 'lsp-bridge-ref-mode-hook (meow-insert-mode))
  :init
  (unless (display-graphic-p)
   (with-eval-after-load 'acm
    (require 'acm-terminal))))
