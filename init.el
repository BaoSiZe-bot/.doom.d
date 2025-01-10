;;; init.el --- The init file of my Doom Emacs
;;; init.el -*- lexical-binding: t; -*-

;;; Commentary:
;;

(fset 'yes-or-no-p 'y-or-n-p)           ;以 y/n代表 yes/no
(transient-mark-mode 1)                 ;标记高亮
(global-subword-mode 1)                 ;Word移动支持 FooBar 的格式
(add-hook 'after-init-hook #'awesome-tray-enable)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (require 'noflet)
  (setq confirm-kill-emacs nil)
  (noflet (process-list) ad-do-it))
(doom! :completion
;;       (corfu +icons +orderless +dabbrev)
       (vertico +icons +childframe)           ; the search engine of the future

       :ui
       ;;deft              ; notational velocity for Emacs
       ;;doom              ; what makes DOOM look the way it does
       doom-dashboard
       (popup +defaults)
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       ;;indent-guides     ; highlighted indent columns
       ;;ligatures         ; ligatures and symbols to make your code pretty again
       ;;minimap           ; show a map of the code on the side
       (vc-gutter +pretty) ; vcs diff in the fringe
       workspaces        ; tab emulation, persistence & separate workspaces

       :checkers
       (syntax +childframe)             ; tasing you for every semicolon you forget

       :editor
       meow
       ;;file-templates    ; auto-snippets for empty files
       ;;fold              ; (nigh) universal code folding
       snippets          ; my elves. They type so I don't have to

       :emacs
       undo              ; persistent, smarter undo for your inevitable mistakes

       :term
       eshell            ; the elisp shell that works everywhere
       vterm                  ; the best terminal emulation

       :tools
       ;;(eval +overlay)     ; run code, run (also, repls)
       magit             ; a git porcelain for Emacs
       (lookup +dictionary +docsets)             ; navigate your code and its documentation


       :lang
       emacs-lisp        ; drown in parentheses
       markdown          ; writing docs for people to ignore
       (org +pretty)              ; organize your plain life in plain text

       :email
       ;;(mu4e +org +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :config
       ;;literate
       ;;use-package
       (default +bindings +smartparens)

       :baosize
       themes
       chinese
       tools
       awesome-tray
       ;;mycorfu
       ;; holo-layer
       eaf
       blink-search
       ;; ;;dape
       sort-tab
       (mycorfu +icons +orderless)
       color-rg
       lsp-copilot
       ;;lspce
       ;;lsp-bridge
       treesit-context
       aweshell
       vterm-run
       )

;;; init.el ends here
