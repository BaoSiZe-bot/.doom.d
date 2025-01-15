(add-to-list 'default-frame-alist '(alpha-background . 85))

(setq doom-font (font-spec :family "VictorMono Nerd Font" :size 17 :weight 'Regular)
      doom-symbol-font (font-spec :family "霞鹜文楷" :size 17 :weight 'Regular)
      doom-variable-pitch-font (font-spec :family "霞鹜文楷" :size 17 :weight 'Regular)
      doom-big-font (font-spec :family "VictorMono Nerd Font" :size 20 :weight 'Regular)
      nerd-icons-font-family "VictorMono Nerd Font")
(set-fontset-font t 'han (font-spec :family "霞鹜文楷" :size 19 :weight 'Regular))
(defun +font-set-emoji (&rest _)
  (set-fontset-font t 'emoji "Noto Color Emoji" nil 'prepend))
(add-hook 'after-setting-font-hook #'+font-set-emoji)

(setq treesit-font-lock-level 4
      major-mode-remap-alist
      '((yaml-mode . yaml-ts-mode)
        (sh-mode . bash-ts-mode)
        (js-mode . js-ts-mode)
        (css-mode . css-ts-mode)
        (c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (c-or-c++-mode . c-or-c++-ts-mode)
        (python-mode . python-ts-mode)))
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
(add-hook 'meow-insert-mode-hook (lambda () (setq jit-lock-defer-time 0.25)))
(add-hook 'meow-normal-mode-hook (lambda () (setq jit-lock-defer-time 0)))

(add-hook 'c++-ts-mode-hook (lambda ()
(setq c-basic-offset 4)
(rainbow-delimiters-mode-enable)
(bind-key "C-c d c" #'cpp-gdb 'c++-ts-mode-map)
 (defun cpp-gdb ()
   (interactive)
   (if buffer-file-name
       (let ((filename (file-name-sans-extension (file-name-nondirectory buffer-file-name))))
         (when (eq 0 (shell-command (concat "g++ -g3 -std=c++17 " buffer-file-name " -o /tmp/cpp-" filename)))
           (gdb (concat "gdb -i=mi /tmp/cpp-" filename))))
     (message "buffer-file-name is nil")))))

(bind-keys ("C-c f o" . consult-org-agenda))

(setq shell-file-name (executable-find "bash"))
(setq-default vterm-shell (executable-find "fish"))
(setq-default explicit-shell-file-name (executable-find "fish"))

(standard-display-unicode-special-glyphs)
(with-eval-after-load 'corfu
  (global-corfu-mode)
  (add-hook 'corfu-mode-hook #'corfu-popupinfo-mode))

;; (advice-add 'save-buffer-kill-emacs :around (lambda (fn &rest)
;;   (require 'noflet)
;;   (setq confirm-kill-emacs nil)
;;   (noflet (process-list) ad-do-it)))
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (require 'noflet)
  (setq confirm-kill-emacs nil)
  (noflet (process-list) ad-do-it))

(custom-set-variables)
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
(custom-set-faces)
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
