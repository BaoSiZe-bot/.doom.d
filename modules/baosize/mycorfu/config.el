;;; completion/corfu/config.el -*- lexical-binding: t; -*-
(use-package corfu
  ;; :diminish
  ;; :defer t
;;  :hook
;;  (minibuffer-setup . +corfu--enable-in-minibuffer)
  :custom
  (corfu-separator ?\s)
  (corfu-auto t)
  (corfu-auto-delay 0.0)
  (corfu-popupinfo-delay '(0.0 . 0.0))
  (corfu-on-exact-match nil)
  (corfu-quit-no-match t)
  (corfu-cycle t)
  (corfu-auto-prefix 2)
  (completion-cycle-threshold 1)
  (tab-always-indent 'complete)
  ;; :bind
  ;; (:map corfu-map
  ;;  ("C-SPC"    . corfu-insert-separator)
  ;;  ("C-n"      . corfu-next)
  ;;  ("C-p"      . corfu-previous)
  ;;  ("M-p"      . corfu-popupinfo-scroll-up)
  ;;  ("M-n"      . corfu-popupinfo-scroll-down)
  ;;  ("M-d"      . corfu-popupinfo-toggle)
  ;;  ("C-x C-k"  . cape-dict)
  ;;  ("C-x C-f"  . cape-file))
  :config
  ;; (defadvice! +corfu--org-return (orig) :around '+org/return
  ;; (if (and (modulep! :completion corfu)
  ;;          corfu-mode
  ;;          (>= corfu--index 0))
  ;;     (corfu-insert)
  ;;   (funcall orig)))
    )

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
