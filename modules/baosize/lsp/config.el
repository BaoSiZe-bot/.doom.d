(add-to-list 'load-path "~/.doom.d/modules/baosize/lsp")

(if (modulep! :baosize lsp +lsp-bridge)
(progn (defun load-lspbridge ()
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
(bind-keys ("C-c k"  . lsp-bridge-popup-documentation)
      ("C-c lr" . lsp-bridge-rename)
      ("C-c la" . lsp-bridge-code-action)
      ("C-c lj" . lsp-bridge-find-def)
      ("C-c lf" . lsp-bridge-code-format)
      ("C-c lx" . lsp-bridge-diagnostic-list)
      ("C-c ln" . lsp-bridge-diagnostic-jump-next)
      ("C-c lp" . lsp-bridge-diagnostic-jump-prev))
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
(add-hook 'doom-after-init-hook #'load-lspbridge))

(if (modulep! :baosize lsp +lspce)
(add-hook 'doom-after-init-hook (lambda ()
(require 'lspce)
(setq lspce-send-changes-idle-time 1)
(defadvice! lspce--root-uri-always-allow-single (&rest _)
  :around 'lspce--root-uri
 (let ((proj (project-current))
       root-uri)
   (setq root-uri
         (if proj
             (project-root proj)
          buffer-file-name))
   (when root-uri
     (lspce--path-to-uri root-uri))))
;; log file
(lspce-disable-logging)
(defun lsp! (&rest _)
  (interactive)
  (lspce-mode 1))
(add-hook 'c++-ts-mode-hook #'lsp!)
(bind-keys :map doom-leader-code-map
           ("r" . lspce-rename)
           ("a" . lspce-code-actions))))

(if (modulep! :baosize lsp +lsp-copilot)
(add-hook 'doom-after-init-hook (lambda ()
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
(require 'load-eglot))))
