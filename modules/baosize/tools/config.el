;;; baosize/tools/config.el -*- lexical-binding: t; -*-
;; Automatically save file content
(use-package! auto-save
  :config
  (auto-save-enable)
  (setq auto-save-silent t)   ; quietly save
  (setq auto-save-delete-trailing-whitespace t))
(use-package! keyfreq
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))
(use-package! highlight-parentheses
    :hook
    (prog-mode . highlight-parentheses-mode))
