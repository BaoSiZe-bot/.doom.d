;; -*- no-byte-compile: t; -*-
;;; baosize/lsp-bridge/packages.el

(package! lsp-bridge
  :recipe (:host github
           :repo "manateelazycat/lsp-bridge"
           :branch "master"
           :files ("*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
           ;; do not perform byte compilation or native compilation for lsp-bridge
           :build (:not compile)))
;; (package! popon)
(package! lsp-mode :disable t :ignore t)
(package! company :disable t :ignore t)
