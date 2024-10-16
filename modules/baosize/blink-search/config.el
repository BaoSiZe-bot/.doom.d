(add-to-list 'load-path "~/.emacs.d/.local/straight/repos/blink-search/")
(use-package! blink-search
  :bind (:map doom-leader-map
            ("SPC" ("Blink search" . blink-search))))
