;; -*- no-byte-compile: t; -*-
;;; baosize/lsp-bridge/packages.el

(package! lsp-bridge
  :recipe (:host github
           :repo "manateelazycat/lsp-bridge"
           :files ("*")))
(package! acm :recipe (:host github :repo "manateelazycat/lsp-bridge" :files ("acm")))
(package! popon)
(package! acm-terminal :recipe (:host github :repo "twlz0ne/acm-terminal"))
(package! lsp-mode :disable t :ignore t)
(package! company :disable t :ignore t)
