;;; baosize/tools/config.el -*- lexical-binding: t; -*-
;; Automatically save file content
(add-hook 'doom-first-file-hook (lambda ()
(use-package auto-save
  :config
  (auto-save-enable)
  (setq auto-save-silent t)   ; quietly save
)
(use-package eee
  :commands
  ee-yazi
  ee-rg
  ee-lazygit
  ee-find
  ee-btop)
(use-package keyfreq
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))
(use-package paren
  :custom-face (show-paren-match ((t (:foreground "SpringGreen3" :underline t :weight bold))))
  :config
  (setq show-paren-when-point-inside-paren t
        show-paren-when-point-in-periphery t
        show-paren-context-when-offscreen t))
(use-package colorful-mode
  :hook (prog-mode text-mode))
(require 'symbol-overlay)
;; (add-hook 'prog-mode-hook #'symbol-overlay-mode)
;; (add-hook 'text-mode-hook #'symbol-overlay-mode)
(global-set-key (kbd "M-i") 'symbol-overlay-put)
(global-set-key (kbd "M-n") 'symbol-overlay-switch-forward)
(global-set-key (kbd "M-p") 'symbol-overlay-switch-backward)
(global-set-key (kbd "<f7>") 'symbol-overlay-mode)
(global-set-key (kbd "<f8>") 'symbol-overlay-remove-all)
(use-package breadcrumb
  :hook (prog-mode . breadcrumb-local-mode))
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode-enable)
(setq winum-keymap
        (let ((map (make-sparse-keymap)))
          (define-key map (kbd "M-0") 'winum-select-window-0-or-10)
          (define-key map (kbd "M-1") 'winum-select-window-1)
          (define-key map (kbd "M-2") 'winum-select-window-2)
          (define-key map (kbd "M-3") 'winum-select-window-3)
          (define-key map (kbd "M-4") 'winum-select-window-4)
          (define-key map (kbd "M-5") 'winum-select-window-5)
          (define-key map (kbd "M-6") 'winum-select-window-6)
          (define-key map (kbd "M-7") 'winum-select-window-7)
          (define-key map (kbd "M-8") 'winum-select-window-8)
          map))
(require 'winum)
(winum-mode)))
