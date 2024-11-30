;;; $DOOMDIR/modules/baosize/awesome-tray/config.el -*- lexical-binding: t; -*-
(defun awesome-tray-winum-module () (winum-get-number-string))
(defface awesome-tray-winum-module-face
  '((t (:italic t)))
  "Winum module face."
  :group 'awesome-tray)
(require 'awesome-tray)
(add-to-list 'awesome-tray-module-alist
       '("winum" . (awesome-tray-winum-module awesome-tray-winum-module-face)))
(setq awesome-tray-belong-update-duration 1
      awesome-tray-active-modules '("winum"
                                    "input-method"
                                    "belong"
                                    "meow"
                                    "file-path"
                                    "buffer-read-only"
                                    "git"
                                    "date"
                                    "clock")
      awesome-tray-input-method-local-style "㞢")
