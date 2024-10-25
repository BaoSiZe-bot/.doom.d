;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/modules/baosize/holo-layer/packages.el
(package! sort-tab
  :recipe (:host github :repo "manateelazycat/sort-tab"
           :files ("*")))
(package! holo-layer
  :recipe (:host github :repo "manateelazycat/holo-layer"
           :files ("*")))
