;; -*- no-byte-compile: t; -*-
;;; baosize/lsp-bridge/packages.el

(package! lsp-bridge
  :recipe (:host github
           :repo "manateelazycat/lsp-bridge"
	   :files ("*")))
           

(package! lsp-mode :disable t :ignore t)
(package! company :disable t :ignore t)