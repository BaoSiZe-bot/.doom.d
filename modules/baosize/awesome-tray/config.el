;;; $DOOMDIR/modules/baosize/awesome-tray/config.el -*- lexical-binding: t; -*-
(defun awesome-tray-winum-module () (if (modulep 'winum)
  (concat " " (int-to-string (winum-get-number)))
  ""))
(defun awesome-tray-lsp-module () (if (not (equal lsp-bridge-mode nil))
  (if (not (equal lsp-bridge-diagnostic-count nil))
      (concat " " (int-to-string lsp-bridge-diagnostic-count))
      " ")
  ""))
(defun awesome-tray-mybelong-module ()
    (let ((origin (if (modulep 'treesit)
      (let ((current-seconds (awesome-tray-current-seconds)))
        (if (or (not (eq (current-buffer) awesome-tray-belong-last-buffer))
                (> (- current-seconds awesome-tray-belong-last-time) awesome-tray-belong-update-duration))
            (progn
              (setq awesome-tray-belong-last-time current-seconds)
              (setq awesome-tray-belong-last-buffer (current-buffer))
              (awesome-tray-update-belong-cache))
          awesome-tray-belong-cache))"")))
        (if (equal origin "") "" (concat "󰡱 " origin))))
(defun awesome-tray-mymeow-module ()
  (let ((origin (with-demoted-errors
      ""
    (if (and (modulep 'meow) awesome-tray-meow-show-mode)
        meow--indicator
      ""))))
    (concat "󰄛" origin)))
(defun awesome-tray-mygit-module ()
  (let ((origin (if (executable-find "git")
      (progn
        (if (not (string= (buffer-file-name) awesome-tray-git-buffer-filename))
            (awesome-tray-git-command-update-cache))
        awesome-tray-git-command-cache)
    "")))
    (if (equal origin "") "" (concat " " origin))))
(defface awesome-tray-winum-module-face
  '((t (:italic t)))
  "Winum module face."
  :group 'awesome-tray)
(defface awesome-tray-module-lsp-face
  '((((background light)) :inherit awesome-tray-orange-face)
    (t :inherit awesome-tray-orange-face))
  "Lsp-bridge face."
  :group 'awesome-tray)

(require 'awesome-tray)
(setq awesome-tray-buffer-read-only-style "󰌾 ")
(setq awesome-tray-mode-line-active-color "#4ea9e6")
(add-to-list 'awesome-tray-module-alist
       '("winum" . (awesome-tray-winum-module awesome-tray-winum-module-face)))
(add-to-list 'awesome-tray-module-alist
       '("mybelong" . (awesome-tray-mybelong-module awesome-tray-module-belong-face)))
(add-to-list 'awesome-tray-module-alist
       '("mymeow" . (awesome-tray-mymeow-module awesome-tray-module-meow-face)))
(add-to-list 'awesome-tray-module-alist
       '("mygit" . (awesome-tray-mygit-module awesome-tray-module-git-face)))
(add-to-list 'awesome-tray-module-alist
       '("lsp" . (awesome-tray-lsp-module awesome-tray-module-lsp-face)))
(setq awesome-tray-belong-update-duration 1
      awesome-tray-active-modules '("winum"
                                    "lsp"
                                    "input-method"
                                    "mybelong"
                                    "mymeow"
                                    "file-path"
                                    "buffer-read-only"
                                    "mygit"
                                    "󰥔"
                                    "date"
                                    "clock")
      awesome-tray-input-method-local-style "㞢")
