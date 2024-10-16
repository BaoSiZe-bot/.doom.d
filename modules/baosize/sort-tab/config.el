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
         ("k" ("Kill Buffer" . sort-tab-close-current-tab)))
        (:map doom-leader-map
         ("`" ("Switch to Last Buffer" . sort-tab-select-last-tab))))
