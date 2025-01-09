;;; baosize/lsp-bridge/config.el -*- lexical-binding: t; -*-
;;(use-package citre
;;  :defer t
;;  :init
;;  (require 'citre-config)
;;  :config
;;  (add-hook 'c-mode-hook 'prog-mode-citre-bindings))
(defun load-lsp ()
  (interactive)
(map! "C-c k"  'lsp-bridge-popup-documentation
      "C-c lr" 'lsp-bridge-rename
      "C-c la" 'lsp-bridge-code-action
      "C-c lj" 'lsp-bridge-find-def
      "C-c lf" 'lsp-bridge-code-format
      "C-c lx" 'lsp-bridge-diagnostic-list
      "C-c ln" 'lsp-bridge-diagnostic-jump-next
      "C-c lp" 'lsp-bridge-diagnostic-jump-prev)
(setq lsp-bridge-enable-inlay-hint t
      acm-enable-doc-markdown-render nil
      acm-enable-search-file-words nil
      lsp-bridge-enable-hover-diagnostic t
;;      acm-enable-citre t
      lsp-bridge-signature-show-function 'lsp-bridge-signature-show-with-frame
      lsp-bridge-signature-show-with-frame-position 'point
      acm-enable-yas nil)
(require 'lsp-bridge)
  (dolist (hook lsp-bridge-default-mode-hooks)
   (add-hook hook (lambda () (lsp-bridge-mode 1)))))
(add-hook! 'doom-first-input-hook (load-lsp))
;; (require 'lsp-bridge)
;; (use-package lsp-bridge :hook (doom-first-input . lsp-global-mode))
