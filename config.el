;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Size Bao"
      frame-title-format (concat "%b - " user-full-name "'s Emacs")
      user-mail-address "baosize@hotmail.com"
      epa-file-encrypt-to user-mail-address)
(setf treemacs-position 'right)
;; System locale to use for formatting time values.
;;
;; Make sure that the weekdays in the time stamps of your Org mode files and in
;; the agenda appear in English.
(setq system-time-locale "C")
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory '("~/.org/"))
(setq org-agenda-files '("~/.org/"))
(map! :map doom-leader-file-map
      :desc "Consult FD"
      "d" '+vertico/consult-fd-or-find)
(map! :map doom-leader-file-map
      :desc "Consult Org"
      "o" 'consult-org-agenda)
(use-package! vc-msg
  :commands
  vc-msg-show
  vc-msg-prompt
  :init
  (map! :map doom-leader-git-map
        :desc "Show vc-msg"
        "s" 'vc-msg-show))
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
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
