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
                            (alpha-background . 95)))
(setq nerd-icons-font-names '("MapleMono-NF-CN-Regular.ttf"))
(setq nerd-icons-font-family "Maple Mono NF CN")
(add-hook! 'after-setting-font-hook #'+font-set-emoji)
(setq treesit-font-lock-level 4)
(defun my-fontify-variable (node override start end &rest _)
  (let ((parent (treesit-node-parent node)) tyn)
    (catch 'break
      (while parent
        (setq tyn (treesit-node-type parent))
        (cond ((or (equal tyn "call_expression") (equal tyn "template_function"))
               (progn
                 (treesit-fontify-with-override (treesit-node-start node) (treesit-node-end node) 'font-lock-function-call-face override start end)
                 (throw 'break nil))))
        (cond ((or (equal tyn "argument_list") (equal tyn "field_expression")) (progn (setq parent nil) (throw 'break nil))))
        (cond (t (setq parent (treesit-node-parent parent))))))
    (when (not parent) (treesit-fontify-with-override (treesit-node-start node) (treesit-node-end node) 'font-lock-variable-use-face override start end))))
(advice-add 'c-ts-mode--fontify-variable :around (lambda (fn &rest args) (eval `(my-fontify-variable ,@args))))
(defun my-c-font-lock-settings (fn mode)
  (if (eq mode 'cpp)
      `(
        ,@(treesit-font-lock-rules
           :language 'cpp
           :feature 'function
           '((destructor_name (identifier) @font-lock-function-name-face))
           :language mode
           :feature 'property
           '((template_method (field_identifier) @font-lock-function-call-face)))
        ,@(funcall fn mode))
    (funcall fn mode)))
(advice-add 'c-ts-mode--font-lock-settings :around 'my-c-font-lock-settings)
(setq doom-theme 'doom-palenight)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq display-line-numbers-type 'relative)
(add-hook 'find-file-hook 'display-line-numbers-mode)
