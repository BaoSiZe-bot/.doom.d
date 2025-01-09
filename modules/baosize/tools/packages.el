;; -*- no-byte-compile: t; -*-
;;; $DOOOMDIR/modules/baosize/tools/packages.el
(package! auto-save
  :recipe (:host github :repo "manateelazycat/auto-save"))
(package! keyfreq
  :recipe (:host github :repo "dacap/keyfreq"))
(package! eee
  :recipe (:host github :repo "eval-exec/eee.el"))
(package! citre :recipe (:host github :repo "universal-ctags/citre" :files ("*") :branch "develop"))
(package! highlight-parentheses)
;;(package! prism :recipe (:host github :repo "alphapapa/prism.el"))
(package! colorful-mode)
(package! symbol-overlay)
