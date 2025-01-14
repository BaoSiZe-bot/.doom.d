;;; completion/corfu/config.el -*- lexical-binding: t; -*-

(use-package corfu
  :custom
  (corfu-separator ?\s)
  (corfu-auto t)
  (corfu-auto-delay 0.0)
  (corfu-popupinfo-delay '(0.1 . 0.1))
  (corfu-on-exact-match nil)
  (corfu-quit-no-match t)
  (corfu-cycle t)
  (corfu-auto-prefix 2)
  (completion-cycle-threshold 1)
  (tab-always-indent 'complete)
  :hook
  (doom-first-buffer . global-corfu-mode)
  :config
  (when (modulep! +minibuffer)
    (add-hook 'minibuffer-setup-hook #'+corfu--enable-in-minibuffer))

  ;; Dirty hack to get c completion running
  ;; Discussion in https://github.com/minad/corfu/issues/34
  
  ;; Reset lsp-completion provider
    ;; Set orderless filtering for LSP-mode completions
  (add-hook 'lsp-completion-mode-hook
            (lambda ()
              (setf (alist-get 'lsp-capf completion-category-defaults) '((styles . (orderless flex))))))
  (add-hook 'corfu-mode-hook #'corfu-popupinfo-mode)
  (bind-keys :map corfu-map
        ("C-SPC"    . corfu-insert-separator)
        ("C-n"      . corfu-next)
        ("C-p"      . corfu-previous)
        ("M-p"      . corfu-popupinfo-scroll-up)
        ("M-n"      . corfu-popupinfo-scroll-down)
        ("M-d"      . corfu-popupinfo-toggle)
        ("C-x C-k"  . cape-dict)
        ("C-x C-f"  . cape-file))
    (defadvice! +corfu--org-return (orig) :around '+org/return
    (if (and (modulep! :completion corfu)
             corfu-mode
             (>= corfu--index 0))
        (corfu-insert)
      (funcall orig))))


;; use corfu-popupinfo instead
;;(use-package corfu-doc
;;  :hook (corfu-mode . corfu-doc-mode)
;;  :custom
;;  (corfu-doc-delay 0)
;;  :bind (:map corfu-map
;;         ("M-n" . corfu-doc-scroll-down)
;;         ("M-p" . corfu-doc-scroll-up)
;;         ("M-d" . corfu-doc-toggle)))

;;(use-package orderless
;;  :when (modulep! +orderless)
;;  :init
;;  (setq completion-styles '(orderless partial-completion)
;;        completion-category-defaults nil
;;        completion-category-overrides '((file (styles . (partial-completion))))))


(use-package nerd-icons-corfu
  :when (modulep! +icons)
  :defer t
  :init
  (with-eval-after-load 'corfu
    (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter)))


(use-package cape
  :defer t
  :init
  (bind-keys ([remap dabbrev-expand] . cape-dabbrev))
  (add-hook 'latex-mode-hook (lambda ()(defun +corfu--latex-set-capfs ()
                                (add-to-list 'completion-at-point-functions #'cape-tex))))
  (when (modulep! :checkers spell)
    (add-to-list 'completion-at-point-functions #'cape-dict)
    (add-to-list 'completion-at-point-functions #'cape-ispell))
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-keyword t)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev t))


(use-package corfu-history
  :after corfu
  :hook (corfu-mode . (lambda ()
                        (corfu-history-mode 1)
                        (savehist-mode 1)
                        (add-to-list 'savehist-additional-variables 'corfu-history))))


(use-package corfu-quick
  :after corfu
  :bind (:map corfu-map
         ("M-q" . corfu-quick-complete)
         ("C-q" . corfu-quick-insert)))


;; TODO This doesn't _quite_ work
;;(use-package evil-collection-corfu
;;  :when (modulep! :editor evil +everywhere)
;;  :defer t
;;  :init (setq evil-collection-corfu-key-themes '(default magic-return))
;;  :config
;;  (evil-collection-corfu-setup))

(use-package yasnippet-capf
  :when (modulep! :editor snippets)
  :defer t
  :init
  (add-hook 'yas-minor-mode-hook (lambda ()
    (defun +corfu-add-yasnippet-capf-h ()
      (add-hook 'completion-at-point-functions #'yasnippet-capf 30 t)))))
