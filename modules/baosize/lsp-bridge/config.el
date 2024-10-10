;;; baosize/lsp-bridge/config.el -*- lexical-binding: t; -*-

(use-package! yasnippet
  :hook
  (prog-mode . yas-minor-mode))
(use-package! lsp-bridge
  :hook
  (prog-mode . lsp-bridge-mode)
  :config
  (setq lsp-bridge-enable-hover-diagnostic t)
  (setq lsp-bridge-symbols-enable-which-func t)
  (setq lsp-bridge-enable-inlay-hint t)
  (setq lsp-bridge-enable-log nil)
  (setq acm-enable-search-file-words nil)
  (setq ac-enable-codeium t)
  (setq lsp-bridge-python-multi-lsp-server "pylsp_ruff")
  (setq acm-enable-lsp-workspace-symbol nil)
  :init
  (map! :map doom-leader-code-map
        :desc "LSP rename"
        "r"             #'lsp-bridge-rename
        :desc "LSP action"
        "a"             #'lsp-bridge-code-action
        :desc "LSP diagnostic"
        "d"             #'lsp-bridge-diagnostic-list
        :desc "LSP diagnostic goto next"
        "n"             #'lsp-bridge-diagnostic-jump-next
        :desc "LSP diagnostic previuos"
        "p"             #'lsp-bridge-diagnostic-jump-prev
        :desc "LSP diagnostic goto next"
        "]"             #'lsp-bridge-diagnostic-jump-next
        :desc "LSP diagnostic previuos"
        "["             #'lsp-bridge-diagnostic-jump-prev
        :desc "LSP find declaration"
        "j"             #'lsp-bridge-find-def
        :desc "Lsp format"
        "f"             #'+format/buffer)
  (map! :map doom-leader-map
        :desc "LSP Hover"
        "k"             #'lsp-bridge-popup-documentation)
  (add-hook! 'lsp-bridge-ref-mode-hook (evil-emacs-state)))

(unless (display-graphic-p)
  (after! acm
    (use-package! acm-terminal)))
