;; -*- no-byte-compile: t; -*-
;;; baosize/tabnine/packages.el

(package! tabnine-capf
  :recipe (:host github
           :repo "50ways2sayhard/tabnine-capf"
           :files ("*.el" "*.sh")))
