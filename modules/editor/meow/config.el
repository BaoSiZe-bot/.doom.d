;;; editor/meow/config.el -*- lexical-binding: t; -*-
(defun meow/setup-keypad ()
 (map! :map meow-keypad-state-keymap
  "?" #'meow-cheatsheet
  "h" #'help-command))
(defun meow/setup ()
  (setq meow-use-cursor-position-hack t
        meow-use-clipboard t
        meow-use-enhanced-selection-effect t)
  (map! :map meow-normal-state-keymap
   "0" #'meow-expand-0
   "1" #'meow-expand-1
   "2" #'meow-expand-2
   "3" #'meow-expand-3
   "4" #'meow-expand-4
   "5" #'meow-expand-5
   "6" #'meow-expand-6
   "7" #'meow-expand-7
   "8" #'meow-expand-8
   "9" #'meow-expand-9
   "-" #'negative-argument
   ";" #'meow-reverse
   "," #'meow-inner-of-thing
   "." #'meow-bounds-of-thing
   "'" #'repeat
   "<escape>" #'ignore))
(defun meow-append-this-line ()
  (interactive)
  (doom/forward-to-last-non-comment-or-eol)
  (meow-insert))
(defun meow/setup-qwerty ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (meow/setup)
  (meow-motion-overwrite-define-key
   '("j" . meow-next)
   '("k" . meow-prev))
  (map! :map meow-normal-state-keymap
   "[" #'meow-beginning-of-thing
   "]" #'meow-end-of-thing
   "a" #'meow-append
   "o" #'meow-open-below
   "A" #'meow-append-this-line
   "b" #'meow-back-word
   "B" #'meow-back-symbol
   "c" #'meow-change
   "x" #'meow-delete
   "D" #'meow-backward-delete
   "e" #'meow-next-word
   "E" #'meow-next-symbol
   "f" #'meow-find
   "g" #'meow-cancel-selection
   "G" #'meow-grab
   "h" #'meow-left
   "H" #'meow-left-expand
   "i" #'meow-insert
   "I" #'meow-open-above
   "j" #'meow-next
   "J" #'meow-next-expand
   "k" #'meow-prev
   "K" #'meow-prev-expand
   "l" #'meow-right
   "L" #'meow-right-expand
   "v" #'meow-left-expand
   "m" #'meow-join
   "n" #'meow-search
   "%" #'meow-block
   "O" #'meow-to-block
   "p" #'meow-yank
   "q" #'meow-quit
   "Q" #'meow-goto-line
   "r" #'meow-replace
   "R" #'meow-swap-grab
   "d" #'meow-kill
   "t" #'meow-till
   "u" #'meow-undo
   "U" #'meow-undo-in-selection
   "/" #'meow-visit
   "w" #'meow-mark-word
   "W" #'meow-mark-symbol
   "V" #'meow-line
   "X" #'meow-goto-line
   "y" #'meow-save
   "Y" #'meow-sync-grab
   "z" #'meow-pop-selection))

(use-package! meow
  :hook (doom-after-modules-config . meow-global-mode)
  :demand t
  :config
  (meow/setup-qwerty)
  (meow/setup-keypad)
  (map! :map meow-keymap [remap describe-key] #'helpful-key)
  (meow-define-keys
   'normal
   '("?" . meow-comment)
   '("F" . avy-goto-char-2)
   '("s" . avy-goto-char-timer)))
