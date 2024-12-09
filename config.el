;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Size Bao"
      frame-title-format (concat "%b - " user-full-name "'s Emacs")
      user-mail-address "baosize@hotmail.com"
      epa-file-encrypt-to user-mail-address
      doom-font (font-spec :family "Victor Mono Nerd Font" :size 16 :weight 'Regular)
      doom-unicode-font (font-spec :family "Victor Mono Nerd Font" :size 16 :weight 'Regular)
      doom-variable-pitch-font (font-spec :family "Victor Mono Nerd Font" :size 16 :weight 'Regular)
      doom-big-font (font-spec :family "Victor Mono Nerd Font" :size 18 :weight 'Regular)
      default-frame-alist '((width . 150)
                            (height . 30)
                            (alpha-background . 96))
      nerd-icons-font-family "Victor Mono Nerd Font"
      treesit-font-lock-level 4
      select-active-regions nil
      select-enable-clipboard 't
      select-enable-primary nil
      interprogram-cut-function #'gui-select-text)
(defun +font-set-emoji (&rest _)
  (set-fontset-font t 'emoji "Noto Color Emoji" nil 'prepend))
(add-hook! 'after-setting-font-hook #'+font-set-emoji)
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
(tool-bar-mode -1)
(menu-bar-mode -1)
(add-hook 'find-file-hook 'display-line-numbers-mode)
;; ui config end
(setq system-time-locale "C"
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
      display-line-numbers-type 'relative
      org-directory '("~/.org/")
      org-agenda-files '("~/.org/")
      dirvish-side-width 30
      major-mode-remap-alist
      '((yaml-mode . yaml-ts-mode)
        (sh-mode . bash-ts-mode)
        (js-mode . js-ts-mode)
        (css-mode . css-ts-mode)
        (c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (c-or-c++-mode . c-or-c++-ts-mode)
        (python-mode . python-ts-mode))
      indent-bars-treesit-support t
      indent-bars-no-descend-string t
      indent-bars-treesit-ignore-blank-lines-types '("module")
      indent-bars-prefer-character t
      indent-bars-zigzag nil
      indent-bars-pattern "|")
(setq-hook! 'c++-ts-mode-hook c-basic-offset 4)
(setq-hook! 'c++-mode-hook c-basic-offset 4)
(set-popup-rule! "^\\*Org Agenda" :side 'bottom :size 0.90 :select t :ttl nil)
(with-eval-after-load 'org
  (setq org-startup-folded nil
        org-startup-indented t))

(setq winum-keymap
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "C-`") 'winum-select-window-by-number)
      (define-key map (kbd "C-²") 'winum-select-window-by-number)
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
(add-hook! 'after-init-hook (winum-mode))

(add-hook! 'prog-mode-hook 'hs-minor-mode)
(defconst hideshow-folded-face '((t (:inherit 'font-lock-comment-face :box t))))
(defun hideshow-folded-overlay-fn (ov)
        (when (eq 'code (overlay-get ov 'hs))
            (let* ((nlines (count-lines (overlay-start ov) (overlay-end ov)))
                    (info (format " ... #%d " nlines)))
                (overlay-put ov 'display (propertize info 'face hideshow-folded-face)))))
(setq hs-set-up-overlay 'hideshow-folded-overlay-fn)

(run-with-idle-timer 1 nil (lambda ()
  (require 'cal-china-x)
  (add-hook! 'calendar-today-visible-hook (calendar-mark-today))
  (setq holiday-local-holidays `((holiday-fixed 3 12 "Arbor Day")
                                 (holiday-fixed 5 1 "International Workers' Day")
                                 (holiday-fixed 5 2 "International Workers' Day")
                                 (holiday-fixed 5 3 "International Workers' Day")
                                 (holiday-fixed 6 1  "Children's Day")
                                 (holiday-fixed 9 10 "Teachers' Day")
                                 (holiday-fixed 10 1 "National Day")
                                 (holiday-fixed 10 2 "National Day")
                                 (holiday-fixed 10 3 "National Day")
                                 (holiday-fixed 10 4 "National Day")
                                 (holiday-fixed 10 5 "National Day")
                                 (holiday-fixed 10 6 "National Day")
                                 (holiday-fixed 10 7 "National Day"))
        holiday-other-holidays '((holiday-fixed 4 22 "Earth Day")
                                 (holiday-fixed 4 23 "World Book Day"))
        calendar-chinese-all-holidays-flag t
        cal-china-x-always-show-jieqi t
        cal-china-x-important-holidays cal-china-x-chinese-holidays
        calendar-holidays (append
                           cal-china-x-important-holidays
                           cal-china-x-general-holidays
                           cal-china-x-chinese-holidays
                           holiday-oriental-holidays
                           holiday-local-holidays
                           holiday-other-holidays)
        calendar-mark-holidays-flag t)))
(add-hook! 'after-init-hook (global-whitespace-mode))
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
     ))
(setq doom-light-theme 'doom-one-light
      doom-dark-theme 'doom-one
      doom-theme doom-dark-theme)
(map! :map doom-leader-file-map
      :desc "Consult FD"
      "d" '+vertico/consult-fd-or-find)
(map! :map doom-leader-file-map
      :desc "Consult Org"
      "o" 'consult-org-agenda)
(use-package vc-msg
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

(setq avy-timeout-seconds 0.25)
(add-hook! 'prog-mode-hook (indent-bars--ts-mode))
(after! posframe (standard-display-unicode-special-glyphs))
(defun clear-minibuffer-after-delay ()
  "?? minibuffer ????"
  (when (minibufferp)
    (delete-region (minibuffer-prompt-end) (point-max))))

(advice-add 'dired-do-copy
            :after
            (lambda (&rest _)
              (run-with-timer 0 nil #'clear-minibuffer-after-delay)))

(defun custom-dired-do-copy ()
  (interactive)
  (add-hook 'post-command-hook 'my-check-abbrev)
  (dired-do-copy nil)
  (remove-hook 'post-command-hook 'my-check-abbrev))
(setq shell-file-name (executable-find "bash"))
(setq-default vterm-shell (executable-find "fish"))
(setq-default explicit-shell-file-name (executable-find "fish"))
;;(use-package railgun) ;I'm highly NOT RECOMMEND enable this.
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
