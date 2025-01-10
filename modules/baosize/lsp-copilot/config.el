(add-hook! 'doom-first-input-hook
(use-package lsp-copilot
  ;; :load-path "/path/to/lsp-copilot"
  :config
  (add-hook! '(emacs-lisp-mode-hook
               c++-ts-mode-hook
               inferior-emacs-lisp-mode-hook
               python-ts-mode-hook
 	       ) #'lsp-copilot-mode)
  ;; Doom Emacs
 ;; (setq lsp-copilot-diagnostics-provider :flymake
 ;;       lsp-copilot-diagnostics--flymake-enabled t)
(map! "C-c lr" #'lsp-copilot-rename
      "C-c la" #'lsp-copilot-execute-code-action
      "C-c lj" #'lsp-copilot-find-definition
      "C-c lf" #'lsp-copilot-format-buffer
      "C-c lx" #'flycheck-list-errors
      "C-c ln" #'flycheck-next-error
      "C-c lp" #'flycheck-previous-error)
  (set-lookup-handlers! 'lsp-copilot-mode
    :definition '(lsp-copilot-find-definition :async t)
    :references '(lsp-copilot-find-references :async t)
    :implementations '(lsp-copilot-find-implementations :async t)
    :type-definition '(lsp-copilot-find-type-definition :async t)
    :documentation '(lsp-copilot-describe-thing-at-point :async t))
))
