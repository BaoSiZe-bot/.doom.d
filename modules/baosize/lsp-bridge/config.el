;;; baosize/lsp-bridge/config.el -*- lexical-binding: t; -*-
(use-package! lsp-bridge
  :hook
  (emacs-lisp-mode . lsp-bridge-mode)
  (c++-ts-mode . lsp-bridge-mode)
  (lisp-interaction-mode . lsp-bridge-mode)
  :custom
  (lsp-bridge-enable-inlay-hint t)
  (acm-enable-search-file-words nil)
  (acm-enable-yas nil)
  (acm-enable-ctags nil)
  (acm-enable-tabnine nil)
  (lsp-bridge-enable-hover-diagnostic t)
  (lsp-bridge-signature-show-function 'lsp-bridge-signature-show-with-frame)
  (lsp-bridge-signature-show-with-frame-position 'point)
  ;; (acm-enable-codeium t)
  ;; (acm-enable-capf t)
  ;; (acm-enable-preview t)
  (lsp-bridge-enable-mode-line nil)
  :bind (:map doom-leader-code-map
         ("r" ("LSP rename" . lsp-bridge-rename))
         ("a" ("LSP action" . lsp-bridge-code-action))
         ("j" ("LSP find declaration" . lsp-bridge-find-def))
         ("f" ("Lsp format" . lsp-bridge-code-format))
         ("x" ("LSP diagnostic list" . lsp-bridge-diagnostic-list))
         ("n" ("LSP diagnostic goto next" . lsp-bridge-diagnostic-jump-next))
         ("p" ("LSP diagnostic previuos" . lsp-bridge-diagnostic-jump-prev)))
        (:map doom-leader-map
         ("k" ("LSP Hover" . lsp-bridge-popup-documentation)))
  ;;:init
  ;;(unless (display-graphic-p)
  ;;(with-eval-after-load 'acm
  ;;  (require 'acm-terminal)))
)
