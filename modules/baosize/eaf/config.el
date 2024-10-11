;;; baosize/eaf/config.el -*- lexical-binding: t; -*-
(use-package! eaf
  ;; :defer 3
  ;; I can't lazy-load eaf because it's dependencies is too large.
  ;; :commands
  ;; eaf-open
  ;; eaf-open-pyqterminal
  ;; eaf-open-ipython
  ;; eaf-open-office
  ;; eaf-open-pdf-from-history
  ;; eaf-open-external
  ;; eaf-open-bookmark
  ;; eaf-open-this-buffer
  ;; eaf-open-browser
  ;; eaf-open-browser-with-history
  ;; eaf-open-browser-other-window
  ;; eaf-open-browser-same-window
  ;; :after
  ;; (:any
  ;;  eaf-browser
  ;;  eaf-pdf-viewer
  ;;  eaf-org-previewer
  ;;  eaf-markdown-previewer
  ;;  eaf-pyqterminal)
  :custom
  (eaf-start-python-process-when-require nil)
  (eaf-org-dark-mode t)
  (eaf-markdown-dark-mode t)
  (eaf-browser-dark-mode t)
  (eaf-browser-search-engines '(("bing" . "https://bing.com/search?q=%s")
                                ("baidu" . "https://www.baidu.com/search?ie=utf-8&q=%s")
                                ("google" . "http://www.google.com/search?ie=utf-8&q=%s")
                                ("duckduckgo" . "https://duckduckgo.com/?q=%s")))
  (eaf-browser-default-search-engine "bing")
  (eaf-pdf-dark-mode t)
  :init
  (setq eaf-evil-leader-key "C-SPC")
  (setq eaf-evil-leader-keymap #'doom/leader)
  (defun eaf-enable-evil-intergration ()
    (interactive)
    (add-hook 'evil-normal-state-entry-hook
              (lambda ()
                (when (derived-mode-p 'eaf-mode)
                  (define-key eaf-mode-map (kbd eaf-evil-leader-key) eaf-evil-leader-keymap)
                  (setq emulation-mode-map-alists
                        (delq 'evil-mode-map-alist emulation-mode-map-alists)))))
    (add-to-list 'evil-insert-state-modes 'eaf-edit-mode))
  (with-eval-after-load "eaf" (eaf-enable-evil-intergration))
  (setq eaf-webengine-font-family "Maple Mono NF CN")
  (setq eaf-webengine-fixed-font-family "Maple Mono NF CN")
  (setq eaf-webengine-serif-font-family "Maple Mono NF CN")
  (setq eaf-pyqterminal-font-family "Maple Mono NF CN")
  (setq eaf-marker-fontsize 16)
  (setq eaf-pyqterminal-font-size 16)
  (setq eaf-webengine-font-size 16)
  (setq eaf-webengine-fixed-font-size 16)
  (map! (:leader
         (:prefix ("e" . "Emacs Application Frame")
          :desc "Open Browser"
          "b" #'eaf-open-browser
          :desc "Open Browser History"
          "h" 'eaf-open-browser-with-history
          :desc "Open Browser Other Window"
          "B" 'eaf-open-browser-other-window
          :desc "Open Browser Same Window"
          "s" 'eaf-open-browser-same-window
          :desc "Open Other File"
          "f" 'eaf-open
          :desc "Open This Buffer"
          "e" 'eaf-open-this-buffer
          :desc "Open EAF bookmarks"
          "m" 'eaf-open-bookmark
          :desc "Open Office File"
          "o" 'eaf-open-office
          :desc "Open PDF History"
          "r" 'eaf-open-pdf-from-history
          :desc "Open Pyqterminal"
          "t" 'eaf-open-pyqterminal
          :desc "Open IPython"
          "i" 'eaf-open-ipython
          :desc "Open Git"
          "g" 'eaf-open-git)))
  (map! :map doom-leader-open-map
        :desc "Open File Manager"
        "/" 'eaf-open-in-file-manager))
(use-package! eaf-browser
  :commands
  eaf-open-bookmark
  eaf-open-browser
  eaf-open-browser-with-history
  eaf-open-browser-other-window
  eaf-open-browser-same-window
  :requires eaf)
(use-package! eaf-pdf-viewer
  :after eaf)
(use-package! eaf-pyqterminal
  :commands
  eaf-open-pyqterminal
  eaf-open-office
  :requires eaf)
(use-package! eaf-markdown-previewer
  :after eaf)
(use-package! eaf-org-previewer
  :after eaf)
(use-package! eaf-image-viewer
  :after eaf)
(use-package! eaf-git
  :commands
  eaf-open-git
  :requires eaf)
(use-package! eaf-file-manager
  :commands
  eaf-open-file-manager
  eaf-open-in-file-manager
  :requires eaf)
