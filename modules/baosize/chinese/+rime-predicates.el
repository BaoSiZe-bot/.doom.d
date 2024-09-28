;;; +rime-predicates.el --- Auto switch between Chinese and English input state.
;;; baosize/chinese/+rime-predicates.el -*- lexical-binding: t; -*-

;; based on cnsunyour's config

;;; Commentary:
;;
;; Some personal custom predicates for `emacs-rime'.
;;
;; With this configuraction, I can continuously input mixed Chinese and English
;; text with punctuation, only using the SpaceBar and the Enter key to assist,
;; without the extra switch key.
;;

;;; Code:

(defun +rime-predicate-after-special-punctuation-p ()
  "If the cursor is after a string prefixed a special punctuation.

Can be used in `rime-disable-predicates' and `rime-inline-predicates'."
  (and (> (point) (save-excursion (back-to-indentation) (point)))
       (let ((string (buffer-substring (point) (max (line-beginning-position) (- (point) 80)))))
         (string-match-p "[@:][a-zA-Z0-9-_]*$" string))))

(defun +rime-predicate-beancount-p ()
  "Predicate input state in `beancount-mode'.

Detect whether current buffer's `major-mode' is `beancount-mode',
and the cursor is in the comments or strings.

Can be used in `rime-disable-predicates' and `rime-inline-predicates'."
  (and (derived-mode-p 'beancount-mode)
       (not (or (nth 3 (syntax-ppss))
                (nth 4 (syntax-ppss))))))
(setq rime-disable-predicates
              '(rime-predicate-evil-mode-p
                rime-predicate-hydra-p
                rime-predicate-space-after-cc-p
                rime-predicate-org-in-src-block-p
                rime-predicate-org-latex-mode-p
                rime-predicate-punctuation-after-space-cc-p
                rime-predicate-punctuation-after-ascii-p
                rime-predicate-punctuation-line-begin-p
                ;; rime-predicate-space-after-ascii-p
                ;; rime-predicate-space-after-cc-p
                rime-predicate-current-uppercase-letter-p
                rime-predicate-after-ascii-char-p))
(setq rime-inline-predicates '(rime-predicate-space-after-cc-p))
(add-hook! (text-mode)
  (setq-local rime-disable-predicates
              '(rime-predicate-evil-mode-p
                rime-predicate-current-uppercase-letter-p
                rime-predicate-after-ascii-char-p
                rime-predicate-org-in-src-block-p
                rime-predicate-org-latex-mode-p
                rime-predicate-punctuation-after-space-cc-p)))

;;; +rime-predicates.el ends here
