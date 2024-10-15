(defun sort-tab-select-visible-1st-tab ()
    (interactive)
    (sort-tab-select-visible-nth-tab 1))
(defun sort-tab-select-visible-2nd-tab ()
    (interactive)
    (sort-tab-select-visible-nth-tab 2))
(defun sort-tab-select-visible-3rd-tab ()
    (interactive)
    (sort-tab-select-visible-nth-tab 3))
(defun sort-tab-select-visible-4th-tab ()
    (interactive)
    (sort-tab-select-visible-nth-tab 4))
(defun sort-tab-select-visible-5th-tab ()
    (interactive)
    (sort-tab-select-visible-nth-tab 5))
(defun sort-tab-select-visible-6th-tab ()
    (interactive)
    (sort-tab-select-visible-nth-tab 6))
(defun sort-tab-select-visible-7th-tab ()
    (interactive)
    (sort-tab-select-visible-nth-tab 7))
(defun sort-tab-select-visible-8th-tab ()
    (interactive)
    (sort-tab-select-visible-nth-tab 8))
(defun sort-tab-select-visible-9th-tab ()
    (interactive)
    (sort-tab-select-visible-nth-tab 9))
(use-package! sort-tab
  :init
  (sort-tab-mode 1)
  :bind (:map doom-leader-buffer-map
         ("]" ("Next Buffer" . sort-tab-select-next-tab))
         ("n" ("Next Buffer" . sort-tab-select-next-tab))
         ("[" ("Previous Buffer" . sort-tab-select-prev-tab))
         ("p" ("Previous Buffer" . sort-tab-select-prev-tab))
         ("l" ("Switch to Last Buffer" . sort-tab-select-last-tab))
         ("K" ("Kill all Buffers" . sort-tab-close-all-tabs))
         ("O" ("Kill Other Buffers" . sort-tab-close-other-tabs))
         ("d" ("Kill Buffer" . sort-tab-close-current-tab))
         ("1" ("1st Buffer" . sort-tab-select-visible-1st-tab))
         ("2" ("2nd Buffer" . sort-tab-select-visible-2nd-tab))
         ("3" ("3rd Buffer" . sort-tab-select-visible-3rd-tab))
         ("4" ("4th Buffer" . sort-tab-select-visible-4th-tab))
         ("5" ("5th Buffer" . sort-tab-select-visible-5th-tab))
         ("6" ("6th Buffer" . sort-tab-select-visible-6th-tab))
         ("7" ("7th Buffer" . sort-tab-select-visible-7th-tab))
         ("8" ("8th Buffer" . sort-tab-select-visible-8th-tab))
         ("9" ("9th Buffer" . sort-tab-select-visible-9th-tab))
         ("k" ("Kill Buffer" . sort-tab-close-current-tab)))
        (:map doom-leader-map
         ("`" ("Switch to Last Buffer" . sort-tab-select-last-tab))))
