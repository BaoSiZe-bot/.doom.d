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
  (eaf-pdf-dark-mode t)
  :init
  (defcustom eaf-evil-leader-key "C-SPC"
    "Leader key trigger" )

  (defcustom eaf-evil-leader-keymap #'doom/leader
    "Leader key bind"
    :type 'keymap)

;;;###autoload
  (defun eaf-enable-evil-intergration ()
    "EAF evil intergration."
    (interactive)

    (add-hook 'evil-normal-state-entry-hook
              (lambda ()
                (when (derived-mode-p 'eaf-mode)
                  (define-key eaf-mode-map (kbd eaf-evil-leader-key) eaf-evil-leader-keymap)
                  (setq emulation-mode-map-alists
                        (delq 'evil-mode-map-alist emulation-mode-map-alists)))))

    (add-to-list 'evil-insert-state-modes 'eaf-edit-mode))

  (with-eval-after-load "eaf"
    (eaf-enable-evil-intergration))
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
          "p" 'eaf-open-ipython))))
(use-package! eaf-browser
  :commands
  eaf-open-bookmark
  eaf-open-browser
  eaf-open-browser-with-history
  eaf-open-browser-other-window
  eaf-open-browser-same-window
  :requires eaf
  :custom (eaf-browser-dark-mode t))
(use-package! eaf-pdf-viewer
  :after eaf
  :custom (eaf-pdf-dark-mode t))
(use-package! eaf-pyqterminal
  :commands
  eaf-open-pyqterminal
  eaf-open-office
  :requires eaf)
(use-package! eaf-markdown-previewer
  :after eaf
  :custom (eaf-markdown-dark-mode t))
(use-package! eaf-org-previewer
  :after eaf
  :custom (eaf-org-dark-mode t))
(use-package! eaf-image-viewer
  :after eaf)
