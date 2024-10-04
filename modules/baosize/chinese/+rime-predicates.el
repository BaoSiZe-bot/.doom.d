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
;;; +rime-predicates.el ends here
