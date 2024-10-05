;;; baosize/eaf/config.el -*- lexical-binding: t; -*-

(use-package! eaf-pdf-viewer
  :commands
  eaf-open
  eaf-open-office
  eaf-open-this-buffer
  eaf-open-pdf-from-history
  eaf-open-bookmark
  eaf-open-external)
(use-package! eaf-pyqterminal
  :commands
  eaf-open-pyqterminal
  eaf-open-ipython
  :init (map! (:leader
               (:prefix ("e" . "Emacs Application Frame")
                :desc "Open Pyqterminal"
                "t" 'eaf-open-pyqterminal
                :desc "Open IPython"
                "p" 'eaf-open-ipython))))
(use-package! eaf
  :init
  (map! (:leader
         (:prefix ("e" . "Emacs Application Frame")
          :desc "Open Other File"
          "f" 'eaf-open
          :desc "Open This Buffer"
          "e" 'eaf-open-this-buffer
          :desc "Open Office File"
          "o" 'eaf-open-office
          :desc "Open PDF History"
          "r" 'eaf-open-pdf-from-history
          :desc "Open EAF bookmarks"))))
(use-package! eaf-markdown-previewer)
(use-package! eaf-org-previewer)
(use-package! eaf-image-viewer)
(use-package! eaf-browser
  :config
  (require 'eaf-evil)
  :init (map! (:leader
               (:prefix ("e" . "Emacs Application Frame")
                :desc "Open Browser"
                "b" 'eaf-open-browser
                :desc "Open Browser History"
                "h" 'eaf-open-browser-with-history
                :desc "Open Browser Other Window"
                "B" 'eaf-open-broser-other-window
                :desc "Open Browser at Same Window"
                "s" 'eaf-open-browser-same-window))))
