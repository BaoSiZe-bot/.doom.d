;; (use-package! breadcrumb  :hook (prog-mode . breadcrumb-local-mode))
(use-package! treesit-context
    :load-path "~/.doom.d/modules/baosize/breadcrumb"
    :hook
    (c++-ts-mode . treesit-context))
