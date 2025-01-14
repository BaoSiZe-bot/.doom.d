(add-hook! 'doom-first-file-hook
(require 'flymake-posframe)
(add-hook 'flymake-mode-hook #'flymake-posframe-mode)
)
