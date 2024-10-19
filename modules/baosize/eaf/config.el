;;;;;;;;;;; baosize/eaf/config.el -*- lexical-binding: t; -*-
(use-package! eaf)
(map! :leader (:prefix ("g" . "EAF")
		:desc "Open this buffer"
		"e" #'eaf-open-this-buffer
		:desc "Open file"
		"f" #'eaf-open
		:desc "open bookmarks"
		"m" #'eaf-open-bookmark))
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
         ("gb" ("Open browser" . eaf-open-browser))
         ("gh" ("Open browser history" . eaf-open-browser-with-history))
         ("gB" ("Open browser other window" . eaf-open-browser-other-window))
         ("gs" ("Open browser same window" . eaf-open-browser-same-window))))
(use-package! eaf-pdf-viewer
  :config
  (setq eaf-pdf-dark-mode t)
  :after eaf)
(use-package! eaf-pyqterminal
  :config
  (setq eaf-pyqterminal-font-size 16
        eaf-pyqterminal-font-family "Maple Mono NF CN")
  :bind (:map doom-leader-map
     ("gt" ("Open pyqterminal" . eaf-open-pyqterminal))
     ("gi" ("Open ipython" . eaf-open-ipython))))
(use-package! eaf-git
  :bind (:map doom-leader-map
     ("gg" ("Open git" . eaf-open-git))))
;(use-package! eaf-file-manager
;  :bind (:map doom-leader-map
;         ("ep" ("Open File Manager" . eaf-open-in-file-manager))))
(add-hook! org-mode (progn (setq eaf-org-dark-mode t) (require 'eaf-org-previewer)))
(add-hook! markdown-mode (progn (setq eaf-markdown-dark-mode t) (require 'eaf-markdown-previewer)))
