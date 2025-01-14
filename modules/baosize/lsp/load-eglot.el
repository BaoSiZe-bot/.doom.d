(add-hook 'doom-first-input-hook (lambda ()
(with-eval-after-load 'eglot
  (use-package eglot-booster
    :after eglot
    :config (eglot-booster-mode))
  (add-to-list 'eglot-server-programs
               `(c++-ts-mode . ("clangd"
                                "--background-index"
			                    "--header-insertion=iwyu"
			                    "--completion-style=detailed"
			                    "--function-arg-placeholders"
			                    "--fallback-style=llvm"
			                    ))))
(add-hook 'c++-ts-mode-hook #'eglot-ensure)
(bind-keys ("C-c lr" . eglot-rename)
           ("C-c la" . eglot-code-actions)
           ("C-c lj" . eglot-find-declaration)
           ("C-c lf" . eglot-format)
           ("C-c lx" . flymake-show-buffer-diagnostics)
           ("C-c ln" . flymake-goto-next-error)
           ("C-c lp" . flymake-goto-prev-error))))
(provide 'load-eglot)
