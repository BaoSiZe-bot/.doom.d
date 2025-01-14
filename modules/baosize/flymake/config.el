(with-eval-after-load 'flymake
(require 'flymake-posframe)
(add-hook 'flymake-mode-hook #'flymake-posframe-mode))
;; (require 'flymake-cppcheck)
;; (add-hook 'c-mode-hook 'flymake-cppcheck-load)
;; (add-hook 'c++-mode-hook 'flymake-cppcheck-load)
