(add-hook! 'doom-first-input-hook
(use-package lsp-copilot
  ;; :load-path "/path/to/lsp-copilot"
  :config
  (add-hook! '(c++-ts-mode-hook
               python-ts-mode-hook
 	       ) #'lsp-copilot-mode)
  ;; Doom Emacs
  (setq lsp-copilot-diagnostics-provider :flymake
        lsp-copilot-diagnostics--flymake-enabled t)
  (map! "C-c lr" #'lsp-copilot-rename
      "C-c la" #'lsp-copilot-execute-code-action
      "C-c lj" #'lsp-copilot-find-definition
      "C-c lf" #'lsp-copilot-format-buffer
      "C-c lx" #'flymake-show-buffer-diagnostics
      "C-c ln" #'flymake-goto-next-error
      "C-c lp" #'flymake-goto-prev-error)
  (set-lookup-handlers! 'lsp-copilot-mode
    :definition '(lsp-copilot-find-definition :async t)
    :references '(lsp-copilot-find-references :async t)
    :implementations '(lsp-copilot-find-implementations :async t)
    :type-definition '(lsp-copilot-find-type-definition :async t)
    :documentation '(lsp-copilot-describe-thing-at-point :async t))
))

(provide 'load-lsp-copilot)
