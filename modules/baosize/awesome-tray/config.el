;;; $DOOMDIR/modules/baosize/awesome-tray/config.el -*- lexical-binding: t; -*-
(defun awesome-tray-winum-module () (winum-get-number-string))
(defface awesome-tray-winum-module-face
  '((t (:italic t)))
  "Winum module face."
  :group 'awesome-tray)
(use-package! awesome-tray
  :config
  (awesome-tray-mode 1)
  (add-to-list 'awesome-tray-module-alist
         '("winum" . (awesome-tray-winum-module awesome-tray-winum-module-face)))
  (setq awesome-tray-belong-update-duration 1
        awesome-tray-active-modules '("winum"
                                      "location"
                                      "input-method"
                                      "belong"
                                      "meow"
                                      "file-path"
                                      "buffer-read-only"
                                      "mode-name"
                                      "git"
                                      "date"
                                      "clock")
        awesome-tray-input-method-local-style "㞢"))
