;; -*- no-byte-compile: t; -*-
;;; baosize/copilot/packages.el

(package! copilot
  :recipe (:host github
           :repo "zerolfx/copilot.el"
           :files ("dist" "*.el")))
