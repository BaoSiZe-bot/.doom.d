;;; init.el -*- lexical-binding: t; -*-
(fset 'yes-or-no-p 'y-or-n-p)           ;以 y/n代表 yes/no
(transient-mark-mode 1)                 ;标记高亮
(global-subword-mode 1)                 ;Word移动支持 FooBar 的格式
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-init-hook (lambda () (doom-load-session)(sort-tab-mode 1)(awesome-tray-mode 1)))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)
(setq my-timer (run-at-time  nil 40 (lambda() (if (> (length (process-list)) 23)(list-processes)()))))
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (require 'noflet)
  (setq confirm-kill-emacs nil)
  (noflet (process-list) ad-do-it))
(doom! :input
       ;;chinese

       :completion
       (vertico +icons +childframe)           ; the search engine of the future

       :ui
       ;;deft              ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does
       ;;(emoji +unicode)  ; 🙂
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       indent-guides     ; highlighted indent columns
       ligatures         ; ligatures and symbols to make your code pretty again
       ;;minimap           ; show a map of the code on the side
       ;;nav-flash         ; blink cursor line after big motions
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       ;;unicode           ; extended unicode support for various languages
       (vc-gutter +pretty) ; vcs diff in the fringe
       workspaces        ; tab emulation, persistence & separate workspaces

       :editor
       meow
       ;;file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       ;;rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to

       :emacs
       ;;electric
       ;;eww
       ;;tramp
       (dired +dirvish +icons)            ; making dired pretty [functional]
       (ibuffer +icons)         ; interactive buffer management
       (undo +tree)              ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :term
       eshell            ; the elisp shell that works everywhere
       vterm

       :checkers


       :tools
       ;;debugger          ; FIXME stepping through code, to help you add bugs
       editorconfig      ; let someone else argue about tabs vs spaces
       (eval +overlay)     ; run code, run (also, repls)
       ;;(lookup +dictionary +docsets)             ; navigate your code and its documentation
       magit             ; a git porcelain for Emacs
       ;;make              ; run make tasks from Emacs
       ;;(pass  +auth)            ; password manager for nerds
       ;;tree-sitter

       :os
       ;;tty               ; improve the terminal Emacs experience

       :lang
       emacs-lisp        ; drown in parentheses
       (markdown +grip)          ; writing docs for people to ignore
       (org              ; organize your plain life in plain text
           +dragndrop       ; file drag & drop support
           ;; +journal
           ;; +passwords
           +pomodoro
           +pretty)

       :email
       ;;(mu4e +org +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       ;;everywhere        ; *leave* Emacs!? You must be joking

       :config
       ;;literate
       ;;use-package
       (default +bindings +smartparens)

       :baosize
       chinese
       tools
       awesome-tray
       ;;copilot
       ;;tabnine
       ;;holo-layer
       eaf
       blink-search
       ;;dape
       sort-tab
       color-rg
       lsp-bridge
       treesit-context
       aweshell)
