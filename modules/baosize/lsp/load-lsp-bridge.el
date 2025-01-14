(defun load-lspbridge ()
  (interactive)
(setq lsp-bridge-completion-popup-predicates '(lsp-bridge--not-follow-complete
                                               lsp-bridge--not-match-hide-keywords
                                               lsp-bridge--not-match-stop-commands
                                               lsp-bridge--not-match-hide-characters
                                               lsp-bridge--not-only-blank-before-cursor
                                               ;; lsp-bridge--not-in-string
                                               lsp-bridge--not-in-org-table
                                               lsp-bridge--not-execute-macro
                                               lsp-bridge--not-in-multiple-cursors
                                               lsp-bridge--not-in-mark-macro
                                               lsp-bridge--is-evil-state
                                               lsp-bridge--is-meow-state
                                               lsp-bridge--not-in-chatgpt-response
                                               lsp-bridge--not-complete-manually
                                               ))
(map! "C-c k"  #'lsp-bridge-popup-documentation
      "C-c lr" #'lsp-bridge-rename
      "C-c la" #'lsp-bridge-code-action
      "C-c lj" #'lsp-bridge-find-def
      "C-c lf" #'lsp-bridge-code-format
      "C-c lx" #'lsp-bridge-diagnostic-list
      "C-c ln" #'lsp-bridge-diagnostic-jump-next
      "C-c lp" #'lsp-bridge-diagnostic-jump-prev)
(setq lsp-bridge-enable-inlay-hint t
      acm-enable-doc-markdown-render nil
      acm-enable-search-file-words nil
      lsp-bridge-enable-hover-diagnostic t
;;      acm-enable-citre t
      lsp-bridge-signature-show-function 'lsp-bridge-signature-show-with-frame
      lsp-bridge-signature-show-with-frame-position 'point
      acm-enable-yas t)
(require 'lsp-bridge)
  (dolist (hook lsp-bridge-default-mode-hooks)
   (add-hook hook (lambda () (lsp-bridge-mode 1)))))
(add-hook! 'doom-first-input-hook (load-lspbridge))

(provide 'load-lsp-bridge)
