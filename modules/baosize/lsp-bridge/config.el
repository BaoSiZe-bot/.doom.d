;;; baosize/lsp-bridge/config.el -*- lexical-binding: t; -*-
(add-to-list 'load-path "~/.emacs.d/.local/straight/repos/lsp-bridge")
(use-package! lsp-bridge
  :defer t
  :custom
  (lsp-bridge-enable-inlay-hint t)
  (acm-enable-doc-markdown-render nil)
  (acm-enable-lsp-workspace-symbol nil)
  (acm-enable-search-file-words nil)
  (lsp-bridge-enable-hover-diagnostic t)
  (lsp-bridge-signature-show-function 'lsp-bridge-signature-show-with-frame)
  (lsp-bridge-signature-show-with-frame-position 'point)
  (lsp-bridge-python-multi-lsp-server 'basedpyright_ruff)
  ;;(acm-enable-preview t)
  (acm-enable-yas nil)
  :init (map! :leader
         "k"  #'lsp-bridge-popup-documentation
         "cr" #'lsp-bridge-rename
         "ca" #'lsp-bridge-code-action
         "cj" #'lsp-bridge-find-def
         "cf" #'lsp-bridge-code-format
         "cx" #'lsp-bridge-diagnostic-list
         "cn" #'lsp-bridge-diagnostic-jump-next
         "cp" #'lsp-bridge-diagnostic-jump-prev))
(add-hook! 'after-init-hook (progn (require 'lsp-bridge)(global-lsp-bridge-mode)))
