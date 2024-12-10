;;; baosize/lsp-bridge/config.el -*- lexical-binding: t; -*-
(use-package! lsp-bridge
  :hook
  (emacs-lisp-mode . lsp-bridge-mode)
  (c++-ts-mode . lsp-bridge-mode)
  (inferior-emacs-lisp-mode . lsp-bridge-mode)
  :custom
  (lsp-bridge-enable-inlay-hint t)
  (acm-enable-search-file-words nil)
  (lsp-bridge-enable-hover-diagnostic t)
  (lsp-bridge-signature-show-function 'lsp-bridge-signature-show-with-frame)
  (lsp-bridge-signature-show-with-frame-position 'point)
  (acm-enable-codeium t)
  (acm-enable-tabnine t)
  (acm-enable-capf t)
  (acm-enable-preview t)
  :bind (("C-c c r" . lsp-bridge-rename)
         ("C-c c a" . lsp-bridge-code-action)
         ("C-c c j" . lsp-bridge-find-def)
         ("C-c c f" . lsp-bridge-code-format)
         ("C-c c x" . lsp-bridge-diagnostic-list)
         ("C-c c n" . lsp-bridge-diagnostic-jump-next)
         ("C-c c p" . lsp-bridge-diagnostic-jump-prev)
         ("C-c k" . lsp-bridge-popup-documentation))
  ;;:init
  ;;(unless (display-graphic-p)
  ;;(with-eval-after-load 'acm
  ;;  (require 'acm-terminal)))
)
