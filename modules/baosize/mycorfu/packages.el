;; -*- no-byte-compile: t; -*-
;;; completion/corfu/packages.el

(package! corfu
  :recipe (:files (:defaults "extensions/*.el")))
(when (featurep! +icons)
(package! nerd-icons-corfu))
;;(package! corfu-doc
;;  :recipe (:host github :repo "galeo/corfu-doc"))
(package! cape)
(package! yasnippet-capf)
(package! popon
  :recipe (:type git :repo "https://codeberg.org/akib/emacs-popon"))
