;;; baosize/chinese/config.el -*- lexical-binding: t; -*-

;; based on cnsunyour's configs

;; (use-package! pangu-spacing
;;   :hook (text-mode . pangu-spacing-mode)
;;   :config
;;   ;; Always insert `real' space in org-mode.
;;   (setq-hook! 'org-mode-hook pangu-spacing-real-insert-separtor t))

(bind-key* "C-\\" #'toggle-input-method)

(use-package! ace-pinyin
  :after avy
  :init (setq ace-pinyin-use-avy t)
  :config (ace-pinyin-global-mode t))

; disable gtk im modules for emacs-pgtk, add "Emacs*UseXIM: false" to ~/.Xresources to disable xim
(when (boundp 'pgtk-use-im-context-on-new-connection)
  (setq pgtk-use-im-context-on-new-connection nil))

(use-package! rime
  :bind
  (:map rime-mode-map
   ("C-`" . #'rime-send-keybinding))
  :custom
  (rime-disable-predicates
      '(rime-predicate-evil-mode-p
           meow-normal-mode-p
           meow-keypad-mode-p
           meow-motion-mode-p
           rime-predicate-hydra-p
           rime-predicate-prog-in-code-p
           rime-predicate-space-after-cc-p
           rime-predicate-org-in-src-block-p
           rime-predicate-org-latex-mode-p
           rime-predicate-punctuation-after-space-cc-p
           rime-predicate-punctuation-after-ascii-p
           rime-predicate-punctuation-line-begin-p
           ;; rime-predicate-space-after-ascii-p
           ;; rime-predicate-space-after-cc-p
           rime-predicate-after-ascii-char-p))
  (default-input-method "rime")
  ;; (rime-share-data-dir
  ;;  (cl-some (lambda (dir)
  ;;             (let ((abs-dir (expand-file-name dir)))
  ;;               (when (file-directory-p abs-dir)
  ;;                 abs-dir)))
  ;;           '("/usr/share/rime-data"
  ;;             "/usr/share/local"
  ;;             "/usr/share")))
  (rime-user-data-dir (expand-file-name "~/.local/share/emacs-rime"))
  (rime-show-candidate 'posframe)
  (rime-posframe-style 'vertical)
  :config
  (add-hook! 'org-mode-hook (activate-input-method default-input-method))
  (unless (fboundp 'rime--posframe-display-content)
    (error "Function `rime--posframe-display-content' is not available."))
  (add-hook 'kill-emacs-hook (lambda () (ignore-errors (rime-lib-finalize)))))

(use-package! pinyinlib
  :commands (pinyinlib-build-regexp-string)
  :init
  (defun orderless-regexp-pinyin (str)
    (setf (car str) (pinyinlib-build-regexp-string (car str)))
    str)
  (advice-add 'orderless-regexp :filter-args #'orderless-regexp-pinyin))
