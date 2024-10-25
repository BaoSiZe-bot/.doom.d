;;; init.el -*- lexical-binding: t; -*-
(setq max-lisp-eval-depth 400
      max-specpdl-size 650
      process-adaptive-read-buffering nil
      read-process-output-max (* 1024 1024)
      frame-inhibit-implied-resize t
      use-dialog-box nil               ;never pop dialog
      inhibit-startup-screen t         ;inhibit start screen
      initial-scratch-message "" ;关闭启动空白buffer, 这个buffer会干扰session恢复
      inhibit-compacting-font-caches t ;使用字体缓存，避免卡顿
      confirm-kill-processes nil       ;退出自动杀掉进程
      async-bytecomp-allowed-packages nil ;避免magit报错
      word-wrap-by-category t             ;按照中文折行
      enable-local-variables :all         ;不要问 .dir-locals 的问题
      completion-auto-select nil       ;避免默认自动选择
      ad-redefinition-action 'accept   ;不要烦人的 redefine warning
      scroll-step 1
      scroll-conservatively 10000
      kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))
(run-with-idle-timer 0.5 nil #'(lambda () (doom-load-session)(sort-tab-mode 1)))
(fset 'yes-or-no-p 'y-or-n-p)           ;以 y/n代表 yes/no
(transient-mark-mode 1)                 ;标记高亮
(global-subword-mode 1)                 ;Word移动支持 FooBar 的格式

(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)
;; To suppress flashing at startup
(setq-default inhibit-redisplay t
              inhibit-message t)
(add-hook 'window-setup-hook
          (lambda ()
            (setq-default inhibit-redisplay nil
                          inhibit-message nil)
            (redisplay)))
;; Don't ask me when close emacs with process is running
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (require 'noflet)
  (noflet (process-list) ad-do-it))
(doom! :input
       ;;chinese

       :completion
       (vertico +icons +childframe)           ; the search engine of the future

       :ui
       ;;deft              ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does
       ;;doom-dashboard   ; I've already restored session so I'm not need use dashboard xd.
       ;;doom-quit         ; DOOM quit-message prompts when you quit Emacs
       ;;(emoji +unicode)  ; 🙂
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       indent-guides     ; highlighted indent columns
       ligatures         ; ligatures and symbols to make your code pretty again
       ;;minimap           ; show a map of the code on the side
       ;;tabs
       ;;modeline          ; snazzy, Atom-inspired modeline, plus API (awesome-tray is not very robust)
       ;;nav-flash         ; blink cursor line after big motions
       ;;ophints           ; highlight the region an operation acts on
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       ;;unicode           ; extended unicode support for various languages
       (vc-gutter +pretty) ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       ;;window-select     ; visually switch windows
       workspaces        ; tab emulation, persistence & separate workspaces
       ;;zen               ; distraction-free coding or writing

       :editor
       meow
       ;;(evil +everywhere); come to the dark side, we have cookies
       ;;file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       ;;format            ; automated prettiness
       ;;lispy             ; vim for lisp, for people who don't like vim
       ;;multiple-cursors  ; editing in many places at once
       ;;rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to
       ;;word-wrap         ; soft wrapping with language-aware indent

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
       debugger          ; FIXME stepping through code, to help you add bugs
       editorconfig      ; let someone else argue about tabs vs spaces
       (eval +overlay)     ; run code, run (also, repls)
       (lookup +dictionary +docsets)             ; navigate your code and its documentation
       magit             ; a git porcelain for Emacs
       ;;make              ; run make tasks from Emacs
       ;;(pass  +auth)            ; password manager for nerds
       ;;pdf               ; pdf enhancements
       tmux              ; an API for interacting with tmux
       tree-sitter

       :os
       tty               ; improve the terminal Emacs experience

       :lang
       (cc +tree-sitter)   ; C++ > C == 1
       emacs-lisp        ; drown in parentheses
       ;;(json +tree-sitter)              ; At least it ain't XML
       ;;lua               ; one-based indices? one-based indices
       (markdown +grip)          ; writing docs for people to ignore
       (org              ; organize your plain life in plain text
           +dragndrop       ; file drag & drop support
           ;; +journal
           ;; +passwords
           +pomodoro
           +pretty)
       ;;(python +tree-sitter)           ; beautiful is better than ugly
       ;;qt                              ; the 'cutest' gui framework ever
       ;;(sh +tree-sitter)               ; she sells {ba,z,fi}sh shells on the C xor

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
