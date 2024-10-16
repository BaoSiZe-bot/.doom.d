;; -*- no-byte-compile: t; -*-
;;; baosize/tools/packages.el


(package! posframe :recipe (:host github :repo "tumashu/posframe" :branch "master" :files ("*")))
(package! auto-save
  :recipe (:host github :repo "manateelazycat/auto-save"))
(package! keyfreq
  :recipe (:host github :repo "dacap/keyfreq"))
