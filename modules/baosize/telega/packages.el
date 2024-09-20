;; -*- no-byte-compile: t; -*-
;;; baosize/telega/packages.el

(package! telega :recipe (:files (:defaults "contrib/*.el" "etc" "server" "Makefile")))
(package! language-detection)
