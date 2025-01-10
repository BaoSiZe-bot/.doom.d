;;;;;;;;;;; baosize/eaf/config.el -*- lexical-binding: t; -*-
(when (and (display-graphic-p) (not (daemonp)))
  (setq eaf-pdf-dark-mode t)
  (add-hook! 'doom-first-input-hook (progn (require 'eaf)(require 'eaf-pdf-viewer)))
(map! "C-c ee" #'eaf-open-this-buffer
      "C-c ef" #'eaf-open
      "C-c em" #'eaf-open-bookmark
      "C-c elc" #'luogu-open-contest
      "C-c eld" #'luogu-open-discuss
      "C-c ele" #'luogu-open-team
      "C-c elp" #'luogu-open-problem
      "C-c elt" #'luogu-open-training
      "C-c elu" #'luogu-open-user-home)
(use-package! eaf-browser
  :config
  (setq ;;eaf-browser-dark-mode t
        eaf-browser-search-engines '(("bing" . "https://bing.com/search?q=%s")
                                     ("baidu" . "https://www.baidu.com/search?ie=utf-8&q=%s")
                                     ("google" . "http://www.google.com/search?ie=utf-8&q=%s")
                                     ("duckduckgo" . "https://duckduckgo.com/?q=%s"))
        eaf-browser-default-search-engine "bing"
        eaf-webengine-font-family "VictorMono Nerd Font"
        eaf-webengine-fixed-font-family "VictorMono Nerd Font"
        eaf-webengine-serif-font-family "VictorMono Nerd Font"
        eaf-webengine-font-size 16
        eaf-webengine-fixed-font-size 16)
  (eaf-bind-key clear_focus "<escape>" eaf-browser-keybinding)
  :bind (("C-c e b" . eaf-open-browser)
         ("C-c e h" . eaf-open-browser-with-history)
         ("C-c e B" . eaf-open-browser-other-window)
         ("C-c e s" . eaf-open-browser-same-window)))
(use-package! eaf-pyqterminal
  :config
  (setq eaf-pyqterminal-font-size 16
        eaf-pyqterminal-font-family "VictorMono Nerd Font")
  (add-hook 'eaf-mode-hook (lambda () (meow-insert)))
  :bind (("C-c e t" . eaf-open-pyqterminal)
         ("C-c e i" . eaf-open-ipython)))
(use-package! eaf-git
  :bind (("C-c e g" . eaf-open-git)))
(use-package! eaf-file-manager
 :bind (("C-c e /" . eaf-open-in-file-manager)))
(add-hook! org-mode (progn (setq eaf-org-dark-mode t) (require 'eaf)(require 'eaf-org-previewer)))
(add-hook! markdown-mode (progn (setq eaf-markdown-dark-mode t) (require 'eaf)(require 'eaf-markdown-previewer)))
(defun luogu-open-problem (pid)
  (interactive "M[Luogu] ProblemID: ")
  (require 'eaf-browser)
  (eaf-open-browser (concat "https://www.luogu.com.cn/problem/" pid)))
(defun luogu-open-problem (did)
  (interactive "M[Luogu] DiscussID: ")
  (require 'eaf-browser)
  (eaf-open-browser (concat "https://www.luogu.com.cn/discuss/" did)))
(defun luogu-open-training (tid)
  (interactive "M[Luogu] TrainingID: ")
  (require 'eaf-browser)
  (eaf-open-browser (concat "https://www.luogu.com.cn/training/" tid)))
(defun luogu-open-user-home (uid)
  (interactive "M[Luogu] UserID: ")
  (require 'eaf-browser)
  (eaf-open-browser (concat "https://www.luogu.com.cn/user/" uid)))
(defun luogu-open-contest (cid)
  (interactive "M[Luogu] ContestID: ")
  (require 'eaf-browser)
  (eaf-open-browser (concat "https://www.luogu.com.cn/contest/" cid)))
(defun luogu-open-team (teamid)
  (interactive "M[Luogu] TeamID: ")
  (require 'eaf-browser)
  (eaf-open-browser (concat "https://www.luogu.com.cn/team/" teamid))))
