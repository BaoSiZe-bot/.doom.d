;;; completion/corfu/config.el -*- lexical-binding: t; -*-

(use-package! corfu
  :custom
  (corfu-separator ?\s)
  (corfu-auto t)
  (corfu-auto-delay 0.0)
  (corfu-on-exact-match nil)
  (corfu-quit-no-match t)
  (corfu-cycle t)
  (corfu-auto-prefix 2)
  (completion-cycle-threshold 1)
  (tab-always-indent 'complete)
  :hook
  (doom-first-buffer . global-corfu-mode)
  :config
  (when (featurep! +minibuffer)
    (add-hook 'minibuffer-setup-hook #'+corfu--enable-in-minibuffer))

  ;; Dirty hack to get c completion running
  ;; Discussion in https://github.com/minad/corfu/issues/34
  (when (and (featurep! :lang cc)
             (equal tab-always-indent 'complete))
    (map! :map c-mode-base-map
          :i [remap c-indent-line-or-region] #'completion-at-point))

  ;; Reset lsp-completion provider
  (add-hook 'doom-init-modules-hook
            (lambda ()
              (after! lsp-mode
                (setq lsp-completion-provider :none))))

  ;; Set orderless filtering for LSP-mode completions
  (add-hook 'lsp-completion-mode-hook
            (lambda ()
              (setf (alist-get 'lsp-capf completion-category-defaults) '((styles . (orderless flex))))))

  (map! :map corfu-map
        "C-SPC"    #'corfu-insert-separator
        "C-n"      #'corfu-next
        "C-p"      #'corfu-previous
        (:prefix "C-x"
         "C-k"     #'cape-dict
         "C-f"     #'cape-file))
  (after! evil
    (advice-add 'corfu--setup :after 'evil-normalize-keymaps)
    (advice-add 'corfu--teardown :after 'evil-normalize-keymaps)
    (evil-make-overriding-map corfu-map))

  (defadvice! +corfu--org-return (orig) :around '+org/return
    (if (and (featurep! :completion corfu)
             corfu-mode
             (>= corfu--index 0))
        (corfu-insert)
      (funcall orig))))


;; (use-package! corfu-doc
;;   :hook (corfu-mode . corfu-doc-mode)
;;   :custom
;;   (corfu-doc-delay 0)
;;   :bind (:map corfu-map
;;          ("M-n" . corfu-doc-scroll-down)
;;          ("M-p" . corfu-doc-scroll-up)
;;          ("M-d" . corfu-doc-toggle)))


(use-package! orderless
  :when (featurep! +orderless)
  :init
  (setq completion-styles '(orderless partial-completion)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))


(use-package! nerd-icons-corfu
  :when (modulep! +icons)
  :defer t
  :init
  (after! corfu
    (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter)))


(use-package! cape
  :defer t
  :init
  (map!
   [remap dabbrev-expand] 'cape-dabbrev)
  (add-hook! 'latex-mode-hook (defun +corfu--latex-set-capfs ()
                                (add-to-list 'completion-at-point-functions #'cape-tex)))
  (when (featurep! :checkers spell)
    (add-to-list 'completion-at-point-functions #'cape-dict)
    (add-to-list 'completion-at-point-functions #'cape-ispell))
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-keyword t)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev t))


(use-package! corfu-history
  :after corfu
  :hook (corfu-mode . (lambda ()
                        (corfu-history-mode 1)
                        (savehist-mode 1)
                        (add-to-list 'savehist-additional-variables 'corfu-history))))


(use-package! corfu-quick
  :after corfu
  :bind (:map corfu-map
         ("M-q" . corfu-quick-complete)
         ("C-q" . corfu-quick-insert)))


;; TODO This doesn't _quite_ work
(use-package! evil-collection-corfu
  :when (featurep! :editor evil +everywhere)
  :defer t
  :init (setq evil-collection-corfu-key-themes '(default magic-return))
  :config
  (evil-collection-corfu-setup))

(use-package! yasnippet-capf
  :when (modulep! :editor snippets)
  :defer t
  :init
  (add-hook! 'yas-minor-mode-hook
    (defun +corfu-add-yasnippet-capf-h ()
      (add-hook 'completion-at-point-functions #'yasnippet-capf 30 t))))
