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
     :desc "Open Browser History"
     "h" 'eaf-open-browser-with-history
     :desc "Open This Buffer"
     "e" 'eaf-open-this-buffer
     :desc "Open Other File"
     "f" 'eaf-open
     :desc "Open IPython"
     "p" 'eaf-open-ipython
     :desc "Open PDF History"
     "r" 'eaf-open-pdf-from-history
     :desc "Open Office File"
     "o" 'eaf-open-office
     :desc "Open Terminal"
     "t" 'eaf-open-pyqterminal))))
(use-package! eaf-pyqterminal
  :commands
  eaf-open-pyqterminal
  eaf-open-ipython)
(use-package! eaf-markdown-previewer)
(use-package! eaf-pdf-viewer)
(use-package! eaf-image-viewer)
(use-package! eaf-org-previewer)
(use-package! eaf-browser)
(use-package! eaf-evil)
