;;; baosize/tools/config.el -*- lexical-binding: t; -*-

;; based on cnsunyour's config

;; gpg 可以读取在 emacs 中输入的密码
(use-package! pinentry :config (pinentry-start))

;; Automatically save file content
(use-package! super-save
  :custom
  (super-save-auto-save-when-idle t)
  (super-save-idle-duration 2)
  :config
  (super-save-mode +1))

;; cleanup trailing whitespaces before save buffers.
;; (add-hook! before-save
;;            #'delete-trailing-whitespace
;;            #'whitespace-cleanup)

;; neopastebin -- emacs pastebin interface
(use-package! neopastebin
  :defer t
  :commands (pastebin-list-buffer-refresh
             pastebin-new)
  :config
  (when (modulep! :editor evil +everywhere)
    (map! :map pastebin--list-map
          :n "d" #'pastebin-delete-paste-at-point
          :n "r" #'pastebin-list-buffer-refresh
          :n "F" #'pastebin-list-buffer-refresh-sort-by-format
          :n "T" #'pastebin-list-buffer-refresh-sort-by-title
          :n "K" #'pastebin-list-buffer-refresh-sort-by-key
          :n "D" #'pastebin-list-buffer-refresh-sort-by-date
          :n "P" #'pastebin-list-buffer-refresh-sort-by-private
          :n "q" #'kill-current-buffer))
  (let ((credentials (auth-source-user-and-password "pastebin")))
    (pastebin-create-login :username "baosize"
                           :dev-key (car credentials)
                           :password (cadr credentials))))
(setenv "GPG_AGENT_INFO" nil)

(use-package! keyfreq
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))
