;;
;;; Common
(defvar +lsp--default-read-process-output-max nil)
(defvar +lsp--default-gcmh-high-cons-threshold nil)
(defvar +lsp--optimization-init-p nil)
(define-minor-mode +lsp-optimization-mode
  "Deploys universal GC and IPC optimizations for `lsp-mode' and `eglot'."
  :global t
  :init-value nil
  (if (not +lsp-optimization-mode)
      (setq-default read-process-output-max +lsp--default-read-process-output-max
                    gcmh-high-cons-threshold +lsp--default-gcmh-high-cons-threshold
                    +lsp--optimization-init-p nil)
  ;; Only apply these settings once!
  (unless +lsp--optimization-init-p
    (setq +lsp--default-read-process-output-max (default-value 'read-process-output-max)
          +lsp--default-gcmh-high-cons-threshold (default-value 'gcmh-high-cons-threshold))
    (setq-default read-process-output-max (* 1024 1024))
    ;; REVIEW LSP causes a lot of allocations, with or without the native JSON
    ;;        library, so we up the GC threshold to stave off GC-induced
    ;;        slowdowns/freezes. Doom uses `gcmh' to enforce its GC strategy,
    ;;        so we modify its variables rather than `gc-cons-threshold'
    ;;        directly.
    (setq-default gcmh-high-cons-threshold (* 2 +lsp--default-gcmh-high-cons-threshold))
    (gcmh-set-high-threshold)
    (setq +lsp--optimization-init-p t))))
(use-package! eglot
  :commands eglot eglot-ensure
  :hook
  (eglot-managed-mode . +lsp-optimization-mode)
  (c++-ts-mode . eglot-ensure)
  :init
  (setq eglot-sync-connect 1
        eglot-autoshutdown t
        eglot-auto-display-help-buffer nil)
  (when (modulep! :checkers syntax -flymake)
    (setq eglot-stay-out-of '(flymake)))
  :config
  (add-to-list 'eglot-server-programs
               `(c++-ts-mode . ("clangd"
                                "--background-index"
			                    "--header-insertion=iwyu")))
  (set-popup-rule! "^\\*eglot-help" :size 0.15 :quit t :select t)
  (set-popup-rule! "*xref*" :size 0.15 :quit t :select t)
  (set-popup-rule! "*eldoc*" :size 0.2 :quit t :select t)
  (set-lookup-handlers! 'eglot--managed-mode
    :definition      #'xref-find-definitions
    :references      #'xref-find-references
    :implementations #'eglot-find-implementation
    :type-definition #'eglot-find-typeDefinition
    :documentation   #'+eglot-lookup-documentation)
  (cl-callf plist-put eglot-events-buffer-config :size 0)
  (add-to-list 'doom-debug-variables '(eglot-events-buffer-config :size 2000000 :format full))
    :bind
  (("C-c lr" . eglot-rename)
   ("C-c la" . eglot-code-actions)
   ("C-c lj" . eglot-find-declaration)
   ("C-c lf" . eglot-format)
   ("C-c lx" . flymake-show-buffer-diagnostics)
   ("C-c ln" . flymake-goto-next-error)
   ("C-c lp" . flymake-goto-prev-error)))
(use-package! consult-eglot
  :when (modulep! :completion vertico)
  :defer t
  :init
  (map! :after eglot
        :map eglot-mode-map
        [remap xref-find-apropos] #'consult-eglot-symbols))
(use-package eglot-booster
  :after eglot
  :config (eglot-booster-mode))
(provide 'load-eglot)
