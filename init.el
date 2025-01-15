;;; init.el -*- lexical-binding: t; -*-
;;; init.el --- The init file of my Doom Emacs
;;; Commentary:
;;
;; (setq max-lisp-eval-depth 100000)
;; (setq max-specpdl-size 100000)

;;(add-hook 'after-init-hook #'awesome-tray-enable)
(doom! :completion
;;       (corfu +icons +orderless +dabbrev)
       (vertico +icons)           ; the search engine of the future

       :ui
       ;;deft              ; notational velocity for Emacs
       ;;doom              ; what makes DOOM look the way it does
       doom-dashboard
       modeline
       (popup +defaults)
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       ;;indent-guides     ; highlighted indent columns
       ;; ligatures         ; ligatures and symbols to make your code pretty again
       ;; minimap           ; show a map of the code on the side
       (vc-gutter +pretty) ; vcs diff in the fringe
       workspaces        ; tab emulation, persistence & separate workspaces

       :checkers
       (syntax +childframe +flymake)             ; tasing you for every semicolon you forget

       :editor
       meow
       ;; file-templates    ; auto-snippets for empty files
       ;; fold              ; (nigh) universal code folding
       ;; format
       snippets          ; my elves. They type so I don't have to

       :emacs
       ;; (ibuffer +icons)
       ;; (dired +icons +dirvish)
       ;; electric
       ;; vc
       ;; undo              ; persistent, smarter undo for your inevitable mistakes

       :term
       ;; eshell            ; the elisp shell that works everywhere
       vterm                  ; the best terminal emulation

       :tools
       eval     ; run code, run (also, repls)
       editorconfig
       ;;(lsp +peek +eglot)
       ;; debugger
       magit             ; a git porcelain for Emacs
       ;; (lookup +dictionary +docsets)             ; navigate your code and its documentation

       :os
       ;; tty

       :lang
       ;;(cc +lsp)
       ;;(json +lsp)
       ;;(python +lsp +pyright +cpython)
       ;;(yaml +lsp)
       ;;(sh +lsp)
       emacs-lisp        ; drown in parentheses
       markdown          ; writing docs for people to ignore
       (org +pretty)              ; organize your plain life in plain text

       :email
       ;;(mu4e +org +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :config
       literate
       ;;use-package
       (default +bindings)

       :baosize
       themes
       chinese
       tools
       ;;awesome-tray
       ;; holo-layer
       eaf
       blink-search
       ;; ;;dape
       sort-tab
       (mycorfu +icons)
       color-rg
       lsp
       treesit-context
       ;; aweshell
       vterm-run
       flymake
       )

;;; init.el ends here
