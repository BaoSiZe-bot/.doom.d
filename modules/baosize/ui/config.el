;;; baosize/ui/config.el -*- lexical-binding: t; -*-

;; based on cnsunyour's config
(setq
 doom-font (font-spec :family "Maple Mono NF CN" :size 16 :weight 'Regular)
 doom-unicode-font (font-spec :family "Maple Mono NF CN" :size 16 :weight 'Regular)
 doom-variable-pitch-font (font-spec :family "Maple Mono NF CN" :size 16 :weight 'Regular)
 doom-big-font (font-spec :family "Maple Mono NF CN" :size 20 :weight 'Regular))
(defun +font-set-emoji (&rest _)
  (set-fontset-font t 'emoji "Noto Color Emoji" nil 'prepend))
(setq default-frame-alist '((width . 192)
                            (height . 45)
                            (alpha-background . 80)))
(add-to-list 'default-frame-alist '(font . "Maple Mono NF CN-11"))
(setq nerd-icons-font-names '("MapleMono-NF-CN-Regular.ttf"))
(setq nerd-icons-font-family "Maple Mono NF CN")
(add-hook! 'after-setting-font-hook #'+font-set-emoji)
(setq catppuccin-flavor 'frappe)
(setq doom-theme 'catppuccin)
(setq-default fill-column 100)
(after! doom-modeline
  (setq doom-modeline-icon nil
        doom-modeline-modal nil))
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq display-line-numbers-type 'relative)
(add-hook 'find-file-hook 'display-line-numbers-mode)
(when (>= emacs-major-version 27)
  (add-hook! (text-mode prog-mode conf-mode)
             #'display-fill-column-indicator-mode))
