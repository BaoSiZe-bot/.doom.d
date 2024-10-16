;;;;;;;;;;; baosize/eaf/config.el -*- lexical-binding: t; -*-
(use-package! eaf
  :config
  (setq eaf-start-python-process-when-require nil
        eaf-marker-fontsize 16
        eaf-evil-leader-key "C-SPC"
        eaf-evil-leader-keymap #'doom/leader)
  (defun eaf-enable-evil-intergration ()
    (interactive)
    (add-hook 'evil-normal-state-entry-hook
              (lambda ()
                (when (derived-mode-p 'eaf-mode)
                  (define-key eaf-mode-map (kbd eaf-evil-leader-key) eaf-evil-leader-keymap)
                  (setq emulation-mode-map-alists
                        (delq 'evil-mode-map-alist emulation-mode-map-alists)))))
    (add-to-list 'evil-insert-state-modes 'eaf-edit-mode))
  (with-eval-after-load "eaf" (eaf-enable-evil-intergration)))
(use-package! eaf-browser
  :config
  (setq eaf-browser-dark-mode t
        eaf-browser-search-engines '(("bing" . "https://bing.com/search?q=%s")
                                     ("baidu" . "https://www.baidu.com/search?ie=utf-8&q=%s")
                                     ("google" . "http://www.google.com/search?ie=utf-8&q=%s")
                                     ("duckduckgo" . "https://duckduckgo.com/?q=%s"))
        eaf-browser-default-search-engine "bing"
        eaf-webengine-font-family "Maple Mono NF CN"
        eaf-webengine-fixed-font-family "Maple Mono NF CN"
        eaf-webengine-serif-font-family "Maple Mono NF CN"
        eaf-webengine-font-size 16
        eaf-webengine-fixed-font-size 16)
  :bind (:map doom-leader-map
         ("eb" ("Open browser" . eaf-open-browser))
         ("eh" ("Open browser history" . eaf-open-browser-with-history))
         ("eB" ("Open browser other window" . eaf-open-browser-other-window))
         ("es" ("Open browser same window" . eaf-open-browser-same-window))))
(use-package! eaf-pdf-viewer
  :config
  (setq eaf-pdf-dark-mode t)
  :after eaf)
(use-package! eaf-pyqterminal
  :config
  (setq eaf-pyqterminal-font-size 16
        eaf-pyqterminal-font-family "Maple Mono NF CN")
  :bind (:map doom-leader-map
     ("et" ("Open pyqterminal" . eaf-open-pyqterminal))
     ("ei" ("Open ipython" . eaf-open-ipython))))
(use-package! eaf-git
  :bind (:prefix doom-leader-alt-key
     ("eg" ("Open git" . eaf-open-git))))
(use-package! eaf-file-manager
  :bind (:map doom-leader-open-map
         ("/" ("Open File Manager" . eaf-open-in-file-manager))))
(use-package! eaf-org-previewer
 :config
 (setq eaf-org-dark-mode t)
 :after eaf)
