;;; baosize/eaf/config.el -*- lexical-binding: t; -*-

(use-package! eaf
  :config
  (map!
   (:leader
    (:prefix ("e" . "Emacs Application Frame")
     :desc "Open Browser"
     "b" 'eaf-open-browser
     :desc "Open Bookmarks"
     "m" 'eaf-open-bookmark
     :desc "Open History"
     "h" 'eaf-open-browser-with-history
     :desc "Open This Buffer"
     "e" 'eaf-open-this-buffer
     :desc "Open Other File"
     "o" 'eaf-open
     :desc "Open IPython"
     "p" 'eaf-open-ipython
     :desc "Open Terminal"
     "t" 'eaf-open-pyqterminal))))
(use-package! eaf-pyqterminal
  :commands
  eaf-open-pyqterminal
  eaf-open-ipython)
(use-package! eaf-markdown-previewer
  :commands
  eaf-open-this-buffer
  eaf-open)
(use-package! eaf-image-viewer
  :commands
  eaf-open-this-buffer
  eaf-open)
(use-package! eaf-org-previewer
  :commands
  eaf-open-this-buffer
  eaf-open)
(use-package! eaf-browser
  :commands
  eaf-open-browser
  eaf-open-browser-same-window
  eaf-open-browser-other-window
  eaf-open-browser-with-history
  eaf-open-browser-in-background
  eaf-open-bookmark)
(use-package! eaf-evil
  :after eaf-browser)
