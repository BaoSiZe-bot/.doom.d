;;; baosize/ui/config.el -*- lexical-binding: t; -*-

;; based on cnsunyour's config
(setq
 doom-font (font-spec :family "Maple Mono" :size 15 :weight 'Regular)
 doom-unicode-font (font-spec :family "Maple Mono" :size 15 :weight 'Regular)
 doom-variable-pitch-font (font-spec :family "Maple Mono" :size 15 :weight 'Regular)
 doom-big-font (font-spec :family "Maple Mono" :size 18 :weight 'Regular))
(defun +font-set-emoji (&rest _)
  (set-fontset-font t 'emoji "Noto Color Emoji" nil 'prepend))
(setq nerd-icons-font-names '("MapleMono-NF-Regular.ttf"))
(setq nerd-icons-font-family "Maple Mono NF")
(add-hook! 'after-setting-font-hook #'+font-set-emoji)
(setq catppuccin-flavor 'frappe)
(defvar doom-theme-dark 'catppuccin)
(setq doom-theme doom-theme-dark)
(setq-default fill-column 100)
(after! doom-modeline
  (setq doom-modeline-icon t
        doom-modeline-modal nil
        doom-modeline-buffer-modification-icon t
        doom-modeline-indent-info t))
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq display-line-numbers-type 'relative)
(add-hook 'find-file-hook 'display-line-numbers-mode)
(when (>= emacs-major-version 27)
  (add-hook! (text-mode prog-mode conf-mode)
             #'display-fill-column-indicator-mode))
