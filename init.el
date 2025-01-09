;;; init.el -*- lexical-binding: t; -*-
(fset 'yes-or-no-p 'y-or-n-p)           ;以 y/n代表 yes/no
(transient-mark-mode 1)                 ;标记高亮
(global-subword-mode 1)                 ;Word移动支持 FooBar 的格式
(add-hook 'after-init-hook (lambda () (awesome-tray-enable)))
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (require 'noflet)
  (setq confirm-kill-emacs nil)
  (noflet (process-list) ad-do-it))
(doom! :completion
       (vertico +icons +childframe)           ; the search engine of the future

       :ui
       ;;deft              ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does
       doom-dashboard
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       ;;indent-guides     ; highlighted indent columns
       ;;ligatures         ; ligatures and symbols to make your code pretty again
       ;;minimap           ; show a map of the code on the side
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       (vc-gutter +pretty) ; vcs diff in the fringe
       workspaces        ; tab emulation, persistence & separate workspaces

       :editor
       meow
       ;;file-templates    ; auto-snippets for empty files
       ;;fold              ; (nigh) universal code folding
       snippets          ; my elves. They type so I don't have to

       :emacs
       ;;(dired +dirvish +icons)            ; making dired pretty [functional]
       undo              ; persistent, smarter undo for your inevitable mistakes

       :term
       eshell            ; the elisp shell that works everywhere

       :tools
       ;;editorconfig      ; let someone else argue about tabs vs spaces
       (eval +overlay)     ; run code, run (also, repls)
       magit             ; a git porcelain for Emacs


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
       chinese
       tools
       awesome-tray
       ;; holo-layer
       eaf
       blink-search
       ;; ;;dape
       sort-tab
       color-rg
       lsp-bridge
       treesit-context
       aweshell
       )
