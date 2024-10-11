(add-to-list 'load-path "~/.emacs.d/.local/straight/build-31.0.50/blink-search/")
(add-to-list 'load-path "~/.emacs.d/.local/straight/repos/blink-search/")
(use-package! blink-search
  :commands
  blink-search
  :custom
  (blink-search-enable-posframe t)
  :init
  (map! :leader
        :desc "Blink Search"
        "C-SPC"            #'blink-search))
