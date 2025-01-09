;;; baosize/lsp-bridge/config.el -*- lexical-binding: t; -*-
;;(use-package citre
;;  :defer t
;;  :init
;;  (require 'citre-config)
;;  :config
;;  (add-hook 'c-mode-hook 'prog-mode-citre-bindings))
(defun load-lsp ()
  (interactive)
(map! :leader
         "k"  #'lsp-bridge-popup-documentation
         "cr" #'lsp-bridge-rename
         "ca" #'lsp-bridge-code-action
         "cj" #'lsp-bridge-find-def
         "cf" #'lsp-bridge-code-format
         "cx" #'lsp-bridge-diagnostic-list
         "cn" #'lsp-bridge-diagnostic-jump-next
         "cp" #'lsp-bridge-diagnostic-jump-prev)
(setq lsp-bridge-enable-inlay-hint t
      acm-enable-doc-markdown-render nil
      acm-enable-search-file-words nil
      lsp-bridge-enable-hover-diagnostic t
;;      acm-enable-citre t
      lsp-bridge-signature-show-function 'lsp-bridge-signature-show-with-frame
      lsp-bridge-signature-show-with-frame-position 'point
      ;;acm-enable-preview t
      acm-enable-yas nil)
(require 'lsp-bridge)
(after! lsp-bridge
  (dolist (hook lsp-bridge-default-mode-hooks)
   (add-hook hook (lambda () (lsp-bridge-mode 1))))))
(add-hook! 'doom-first-input-hook (load-lsp))
;; (require 'lsp-bridge)
;; (use-package lsp-bridge :hook (doom-first-input . lsp-global-mode))
