;;; baosize/eaf/config.el -*- lexical-binding: t; -*-
(use-package! eaf
  :load-path "~/.emacs.d/.local/straight/repos/emacs-application-framework/"
  :init
  (add-to-list 'load-path "~/.emacs.d/.local/straight/repos/emacs-application-framework/")
  (require 'eaf)
  (require 'eaf-pyqterminal)
  (require 'eaf-git)
  (require 'eaf-markdown-previewer)
  (require 'eaf-pdf-viewer)
  (require 'eaf-image-viewer)
  (require 'eaf-system-monitor)
  (require 'eaf-org-previewer)
  (require 'eaf-browser)
  (require 'eaf-file-manager)
  (require 'eaf-evil)
  (map!
    (:leader
      (:prefix ("e" . "Emacs Application Frame")
       :desc "Open Browser"
       "b" 'eaf-open-browser
       :desc "Open Bookmarks"
       "m" 'eaf-open-bookmark
       :desc "Open History"
       "h" 'eaf-open-browser-with-history
       :desc "Open System Monitor"
       "s" 'eaf-open-system-monitor
       :desc "Open File Manager"
       "f" 'eaf-open-file-manager
       :desc "Open This Buffer"
       "e" 'eaf-open-this-buffer
       :desc "Open Other File"
       "o" 'eaf-open
       :desc "Open IPython"
       "p" 'eaf-open-ipython
       :desc "Open Terminal"
       "t" 'eaf-open-pyqterminal
       :desc "Open Git"
       "g" 'eaf-open-git)))
  :custom
  (eaf-browser-dark-mode nil))
