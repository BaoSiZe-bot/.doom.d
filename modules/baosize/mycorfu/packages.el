;; -*- no-byte-compile: t; -*-
;;; completion/corfu/packages.el

(package! corfu
  :recipe (:files (:defaults "extensions/*.el")))
(when (modulep! +icons)
(package! nerd-icons-corfu))
(package! cape)
