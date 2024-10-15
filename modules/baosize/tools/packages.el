;; -*- no-byte-compile: t; -*-
;;; baosize/tools/packages.el


(package! pinentry)
(package! dash-at-point)
(package! posframe :recipe (:host github :repo "tumashu/posframe" :branch "master" :files ("*")))
(package! alert)
(package! auto-save
  :recipe (:host github :repo "manateelazycat/auto-save"))
(package! neopastebin
  :recipe (:host github :repo "dhilst/emacs-pastebin" :fork "cnsunyour/emacs-pastebin"))
(package! keyfreq
  :recipe (:host github :repo "dacap/keyfreq"))
