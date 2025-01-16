;;; baosize/tools/config.el -*- lexical-binding: t; -*-
;; Automatically save file content
(use-package super-save
  :diminish
  :defer 0.5
  :config
  (add-to-list 'super-save-triggers 'switch-window)
  (setq super-save-exclude '(".gpg"))
  (setq super-save-idle-duration 1)
  (setq super-save-all-buffers 1)
  (setq super-save-auto-save-when-idle t)
  (setq super-save-silent t)
  (super-save-mode 1))
(use-package keyfreq
  :defer t
  :hook (doom-first-input . keyfreq-mode)
        (doom-first-input . keyfreq-autosave-mode))
(use-package paren
  :defer t
  :custom-face (show-paren-match ((t (:foreground "SpringGreen3" :underline t :weight bold))))
  :config
  (setq show-paren-when-point-inside-paren t
        show-paren-when-point-in-periphery t
        show-paren-context-when-offscreen t))
(use-package colorful-mode
  :defer t
  :hook (prog-mode text-mode))
(use-package symbol-overlay
    :bind
    (("M-i" . symbol-overlay-put)
    ("M-n" . symbol-overlay-switch-forward)
    ("M-p" . symbol-overlay-switch-backward)
    ("<f7>" . symbol-overlay-mode)
    ("<f8>" . symbol-overlay-remove-all)))
    ;; (add-hook 'prog-mode-hook #'symbol-overlay-mode)
    ;; (add-hook 'text-mode-hook #'symbol-overlay-mode)

(use-package breadcrumb
  :defer t
  :hook (prog-mode . breadcrumb-local-mode))
(use-package winum
  :defer 0.5
  :config
  (winum-mode)
  :init
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
        map)))

(display-time-mode)
(fset 'yes-or-no-p 'y-or-n-p)
(global-subword-mode 1)
