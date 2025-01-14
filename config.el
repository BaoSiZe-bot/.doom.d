;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq-default mode-line-format nil)
(display-time-mode)
(setq user-full-name "Size Bao"
      frame-title-format (concat "%b - " user-full-name "'s Emacs")
      user-mail-address "baosize@hotmail.com"
      display-line-numbers-type 'relative
      epa-file-encrypt-to user-mail-address
      doom-font (font-spec :family "VictorMono Nerd Font" :size 17 :weight 'Regular)
      doom-symbol-font (font-spec :family "霞鹜文楷" :size 17 :weight 'Regular)
      doom-variable-pitch-font (font-spec :family "霞鹜文楷" :size 17 :weight 'Regular)
      doom-big-font (font-spec :family "VictorMono Nerd Font" :size 20 :weight 'Regular)
      nerd-icons-font-family "VictorMono Nerd Font"
      treesit-font-lock-level 4)
(set-fontset-font t 'han (font-spec :family "霞鹜文楷" :size 19 :weight 'Regular))
(defun +font-set-emoji (&rest _)
  (set-fontset-font t 'emoji "Noto Color Emoji" nil 'prepend))
(add-hook 'after-setting-font-hook #'+font-set-emoji)
(tool-bar-mode -1)
(menu-bar-mode -1)
(add-hook 'find-file-hook #'display-line-numbers-mode)
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
;; ui config end
(add-hook 'doom-first-input-hook (lambda ()
  (add-hook 'meow-insert-mode-hook (lambda () (setq jit-lock-defer-time 0.25)))
  (add-hook 'meow-normal-mode-hook (lambda () (setq jit-lock-defer-time 0)))
  (setq system-time-locale "C"
        ;; If you use `org' and don't want your org files in the default location below,
        ;; change `org-directory'. It must be set before org loads!
        org-directory '("~/.org/")
        org-agenda-files '("~/.org/")
        select-active-regions nil
        select-enable-clipboard 't
        select-enable-primary nil
        ;; flycheck-cppcheck-checks '("warning" "performance" "portability" "unusedFunction")
        ;; flycheck-cppcheck-inconclusive t
        interprogram-cut-function #'gui-select-text
        epa-pinentry-mode 'loopback
        major-mode-remap-alist
        '((yaml-mode . yaml-ts-mode)
          (sh-mode . bash-ts-mode)
          (js-mode . js-ts-mode)
          (css-mode . css-ts-mode)
          (c-mode . c-ts-mode)
          (c++-mode . c++-ts-mode)
          (c-or-c++-mode . c-or-c++-ts-mode)
          (python-mode . python-ts-mode)))
  (add-hook 'c++-ts-mode-hook (lambda ()(setq c-basic-offset 4)))
  (add-hook 'c++-mode-hook (lambda ()(setq c-basic-offset 4)))
  (add-hook 'c++-ts-mode-hook #'rainbow-delimiters-mode-enable)
  (set-popup-rule! "^\\*Org Agenda" :side 'bottom :size 0.90 :select t :ttl nil)
  (with-eval-after-load 'org
    (setq org-startup-folded nil
          org-startup-indented t))
  (add-hook 'prog-mode-hook #'hs-minor-mode)
  (defconst hideshow-folded-face '((t (:inherit 'font-lock-comment-face :box t))))
  (defun hideshow-folded-overlay-fn (ov)
    (when (eq 'code (overlay-get ov 'hs))
      (let* ((nlines (count-lines (overlay-start ov) (overlay-end ov)))
             (info (format " ... #%d " nlines)))
        (overlay-put ov 'display (propertize info 'face hideshow-folded-face)))))
  (setq hs-set-up-overlay 'hideshow-folded-overlay-fn)
                                        ; 内置mode
  (require 'cal-china-x)
  (add-hook 'calendar-today-visible-hook #'calendar-mark-today)
  (setq holiday-local-holidays `((holiday-fixed 3 12 "Arbor Day")
                                 (holiday-fixed 5 1 "International Workers' Day")
                                 (holiday-fixed 5 2 "International Workers' Day")
                                 (holiday-fixed 5 3 "International Workers' Day")
                                 (holiday-fixed 6 1  "Children's Day")
                                 (holiday-fixed 9 10 "Teachers' Day")
                                 ;;`(cl-loop for i in (number-sequence 1 6)
                                 ;;   collect (holiday-fixed 10 i "National Day"))
                                 (holiday-fixed 10 1 "National Day")
                                 (holiday-fixed 10 2 "National Day")
                                 (holiday-fixed 10 3 "National Day")
                                 (holiday-fixed 10 4 "National Day")
                                 (holiday-fixed 10 5 "National Day")
                                 (holiday-fixed 10 6 "National Day")
                                 (holiday-solar-term "立春" "立春")
                                 (holiday-solar-term "雨水" "雨水")
                                 (holiday-solar-term "惊蛰" "惊蛰")
                                 (holiday-solar-term "春分" "春分")
                                 (holiday-solar-term "清明" "清明")
                                 (holiday-solar-term "谷雨" "谷雨")
                                 (holiday-solar-term "立夏" "立夏")
                                 (holiday-solar-term "小满" "小满")
                                 (holiday-solar-term "芒种" "芒种")
                                 (holiday-solar-term "夏至" "夏至")
                                 (holiday-solar-term "小暑" "小暑")
                                 (holiday-solar-term "大暑" "大暑")
                                 (holiday-solar-term "立秋" "立秋")
                                 (holiday-solar-term "处暑" "处暑")
                                 (holiday-solar-term "白露" "白露")
                                 (holiday-solar-term "秋分" "秋分")
                                 (holiday-solar-term "寒露" "寒露")
                                 (holiday-solar-term "霜降" "霜降")
                                 (holiday-solar-term "立冬" "立冬")
                                 (holiday-solar-term "小雪" "小雪")
                                 (holiday-solar-term "大雪" "大雪")
                                 (holiday-solar-term "冬至" "冬至")
                                 (holiday-solar-term "小寒" "小寒")
                                 (holiday-solar-term "大寒" "大寒")
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
        calendar-mark-holidays-flag t)
  (setq
   whitespace-style
   '(empty            ; empty lines at beginning/end of buffer
     lines-tail       ; lines go beyond `fill-column'
     space-before-tab ; spaces before tab
     trailing         ; trailing blanks
     tabs             ; tabs (show by face)
     tab-mark         ; tabs (show by symbol)
     ))
  (global-whitespace-mode)
(after! c++-ts-mode
 (bind-key "C-c d c" #'cpp-gdb 'c++-ts-mode-map)
 (defun cpp-gdb ()
   (interactive)
   (if buffer-file-name
       (let ((filename (file-name-sans-extension (file-name-nondirectory buffer-file-name))))
         (when (eq 0 (shell-command (concat "g++ -g3 -std=c++17 " buffer-file-name " -o /tmp/cpp-" filename)))
           (gdb (concat "gdb -i=mi /tmp/cpp-" filename))))
     (message "buffer-file-name is nil"))))))
(bind-keys ("C-c f d" . +vertico/consult-fd-or-find)
           ("C-c f o" . consult-org-agenda))
;; keymap bind end

(setq avy-timeout-seconds 0.18)
(with-eval-after-load 'posframe (standard-display-unicode-special-glyphs))
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
  (add-hook 'post-command-hook #'my-check-abbrev)
  (dired-do-copy nil)
  (remove-hook 'post-command-hook 'my-check-abbrev))
(setq shell-file-name (executable-find "bash"))
(setq-default vterm-shell (executable-find "fish"))
(setq-default explicit-shell-file-name (executable-find "fish"))
(add-to-list 'default-frame-alist '(alpha-background . 85))
(with-eval-after-load 'corfu (global-corfu-mode))
;; (use-package trekker :load-path "~/trekker" :config (trekker-enable))
;;(use-package railgun) ;I'm highly NOT RECOMMEND enable this.
(custom-set-variables)
;; '(flymake-cppcheck-location 'tempdir)
;; '(flymake-cppcheck-enable "warning,performance,unusedFunction,portability")
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
(custom-set-faces)
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
