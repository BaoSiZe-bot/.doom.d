(add-hook 'doom-first-input-hook (lambda ()
(use-package lsp-copilot
  ;; :load-path "/path/to/lsp-copilot"
  :config
  (add-hook 'c++-ts-mode-hook #'lsp-copilot-mode)
  (add-hook 'python-ts-mode-hook #'lsp-copilot-mode)
  ;; Doom Emacs
  (setq lsp-copilot-diagnostics-provider :flymake
        lsp-copilot-diagnostics--flymake-enabled t)
  (bind-keys ("C-c lr" . lsp-copilot-rename)
        ("C-c la" . lsp-copilot-execute-code-action)
        ("C-c lj" . lsp-copilot-find-definition)
        ("C-c lf" . lsp-copilot-format-buffer)
        ("C-c lx" . flymake-show-buffer-diagnostics)
        ("C-c ln" . flymake-goto-next-error)
        ("C-c lp" . flymake-goto-prev-error)))))

(provide 'load-lsp-copilot)
