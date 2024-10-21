;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq meow-use-cursor-position-hack t
      meow-use-enhanced-selection-effect t)
(setq user-full-name "Size Bao"
      frame-title-format (concat "%b - " user-full-name "'s Emacs")
      user-mail-address "baosize@hotmail.com"
      epa-file-encrypt-to user-mail-address)
(setq
 doom-font (font-spec :family "Maple Mono NF CN" :size 16 :weight 'Regular)
 doom-unicode-font (font-spec :family "Maple Mono NF CN" :size 16 :weight 'Regular)
 doom-variable-pitch-font (font-spec :family "Maple Mono NF CN" :size 16 :weight 'Regular)
 doom-big-font (font-spec :family "Maple Mono NF CN" :size 20 :weight 'Regular))
(defun +font-set-emoji (&rest _)
  (set-fontset-font t 'emoji "Noto Color Emoji" nil 'prepend))
(setq default-frame-alist '((width . 192)
                            (height . 45)
                            (alpha-background . 96)))
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
(setq doom-theme 'doom-one)
(add-hook! 'doom-modeline-before-github-fetch-notification-hook #'auth-source-pass-enable)
(size-indication-mode -1)
(after! doom-modeline
  (display-time-mode 1)
  (setq doom-modeline-icon t
        doom-modeline-major-mode-color-icon t
        doom-modeline-buffer-state-icon t
        doom-modeline-buffer-modification-icon t
        doom-modeline-time t
        doom-modeline-time-icon t
        doom-modeline-time-live-icon t
        doom-modeline-time-analogue-clock t
        doom-modeline-modal t
        doom-modeline-display-default-persp-name nil
        doom-modeline-position-column-line-format '("L%l")
        doom-modeline-position-line-format '("L%l")
        doom-modeline-position-column-format '("")
        doom-modeline-modal-icon t
        doom-modeline-modal-modern-icon t
        doom-modeline-repl t
        doom-modeline-buffer-encoding t
        doom-modeline-lsp nil
        doom-modeline-support-imenu t
        doom-modeline-project-detection 'projectile
        doom-modeline-mu4e t
        doom-modeline-github t
        doom-modeline-minor-modes nil
        doom-modeline-buffer-modification-icon t)
 (when (and (display-graphic-p) (not (daemonp)))
  (setq doom-modeline-major-mode-icon t)))
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq display-line-numbers-type 'relative)
(add-hook 'find-file-hook 'display-line-numbers-mode)
(setf treemacs-position 'right)

;; ui config end

(setq system-time-locale "C")
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory '("~/.org/"))
(setq org-agenda-files '("~/.org/"))
(setq dirvish-side-width 30)
(setq-hook! 'c++-ts-mode-hook c-basic-offset 4)
(setq-hook! 'c++-mode-hook c-basic-offset 4)
(setq meow-use-clipboard t)
(setq major-mode-remap-alist
      '((yaml-mode . yaml-ts-mode)
        (sh-mode . bash-ts-mode)
        (js-mode . js-ts-mode)
        (css-mode . css-ts-mode)
        (c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (c-or-c++-mode . c-or-c++-ts-mode)
        (python-mode . python-ts-mode)))

;; value set end

(use-package hideshow
  :diminish hs-minor-mode
  :hook (prog-mode . hs-minor-mode)
  :config
    (defconst hideshow-folded-face '((t (:inherit 'font-lock-comment-face :box t))))
    (defun hideshow-folded-overlay-fn (ov)
        (when (eq 'code (overlay-get ov 'hs))
            (let* ((nlines (count-lines (overlay-start ov) (overlay-end ov)))
                    (info (format " ... #%d " nlines)))
                (overlay-put ov 'display (propertize info 'face hideshow-folded-face)))))
    (setq hs-set-up-overlay 'hideshow-folded-overlay-fn))
(setq holiday-local-holidays `((holiday-fixed 3 12 "Arbor Day")
                               ,@(cl-loop for i from 1 to 3
                                          collect `(holiday-fixed 5 ,i "International Workers' Day"))
                               (holiday-fixed 6 1  "Children's Day")
                               (holiday-fixed 9 10 "Teachers' Day")
                               ,@(cl-loop for i from 1 to 7
                                          collect `(holiday-fixed 10 ,i "National Day"))))
(add-hook! 'calendar-today-visible-hook (calendar-mark-today))
(use-package whitespace
  :hook (after-init . global-whitespace-mode)
  :config
  ;; Don't use different background for tabs.
  (face-spec-set 'whitespace-tab
                 '((t :background unspecified)))
  (face-spec-set 'whitespace-line
                 '((((background light))
                    :background "#d8d8d8" :foreground unspecified
                    :underline t :weight unspecified)
                   (t
                    :background "#404040" :foreground unspecified
                    :underline t :weight unspecified)))
  (face-spec-set 'whitespace-space-before-tab
                 '((((background light))
                    :background "#d8d8d8" :foreground "#de4da1")
                   (t
                    :inherit warning
                    :background "#404040" :foreground "#ee6aa7")))

  (setq
   whitespace-line-column nil
   whitespace-style
   '(face             ; visualize things below:
     empty            ; empty lines at beginning/end of buffer
     lines-tail       ; lines go beyond `fill-column'
     space-before-tab ; spaces before tab
     trailing         ; trailing blanks
     tabs             ; tabs (show by face)
     tab-mark         ; tabs (show by symbol)
     )))
;; builtin package config end

(map! :map doom-leader-file-map
      :desc "Consult FD"
      "d" '+vertico/consult-fd-or-find)
(map! :map doom-leader-file-map
      :desc "Consult Org"
      "o" 'consult-org-agenda)
(use-package! vc-msg
  :bind (:map doom-leader-map
        ("vi" ("Show vc-msg" . vc-msg-show))))
(after! c++-ts-mode
  (map! (:leader
    (:prefix ("d" . "debug")
     :desc "Run cpp in gdb"
     :n "c" #'cpp-gdb)))
  (defun cpp-gdb ()
    (interactive)
    (if buffer-file-name
        (let ((filename (file-name-sans-extension (file-name-nondirectory buffer-file-name))))
          (when (eq 0 (shell-command (concat "clang++ -g -std=c++2c \"" buffer-file-name "\" -o \"/tmp/cpp-" filename "\"")))
            (gdb (concat "gdb -i=mi \"/tmp/cpp-" filename "\""))))
      (message "buffer-file-name is nil"))))

;; keymap bind end

(add-hook! 'prog-mode-hook (indent-bars--ts-mode))
;;(use-package! railgun) ;I'm highly NOT RECOMMEND enable this.
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
