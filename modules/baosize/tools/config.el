;;; baosize/tools/config.el -*- lexical-binding: t; -*-
;; Automatically save file content
(use-package! auto-save
  :config
  (auto-save-enable)
  (setq auto-save-silent t)   ; quietly save
  (setq auto-save-delete-trailing-whitespace t))
(use-package! eee
  :commands
  ee-yazi
  ee-rg
  ee-lazygit
  ee-find
  ee-btop)
(use-package! keyfreq
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))
(use-package paren
  :custom-face (show-paren-match ((t (:foreground "SpringGreen3" :underline t :weight bold))))
  :config
  (setq show-paren-when-point-inside-paren t
        show-paren-when-point-in-periphery t
        show-paren-context-when-offscreen t))
(use-package highlight-parentheses
  :hook ((minibuffer-setup . highlight-parentheses-minibuffer-setup)
         (prog-mode . highlight-parentheses-mode))
  :config
  (setq highlight-parentheses-colors '("firebrick1" "firebrick3" "orange1" "orange3")
        highlight-parentheses-attributes '((:underline t) (:underline t) (:underline t))))
(use-package colorful-mode
  :hook (prog-mode text-mode))
(require 'symbol-overlay)
(add-hook 'prog-mode-hook #'symbol-overlay-mode)
(add-hook 'text-mode-hook #'symbol-overlay-mode)
(global-set-key (kbd "M-i") 'symbol-overlay-put)
(global-set-key (kbd "M-n") 'symbol-overlay-switch-forward)
(global-set-key (kbd "M-p") 'symbol-overlay-switch-backward)
(global-set-key (kbd "<f7>") 'symbol-overlay-mode)
(global-set-key (kbd "<f8>") 'symbol-overlay-remove-all)
;;(use-package breadcrumb
;;  :hook (prog-mode . breadcrumb-local-mode))
;; (add-hook! 'emacs-lisp-mode-hook (rainbow-delimiters-mode -1))
;; (use-package prism
;;   :hook (c++-ts-mode . prism-mode)
;;         (emacs-lisp-mode . prism-mode))
