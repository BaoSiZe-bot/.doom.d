;; -*- no-byte-compile: t; -*-
;;; baosize/ui/packages.el


(package! awesome-tab
  :recipe (:host github :repo "manateelazycat/awesome-tab"))
(package! srcery-theme)
(package! flucui-themes)
(package! lab-themes)
(when IS-LINUX (package! dbus))
