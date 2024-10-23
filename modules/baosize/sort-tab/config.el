;;; $DOOMDIR/modules/baosize/sort-tab/config.el -*- lexical-binding: t; -*-
(use-package! sort-tab
;;  :defer t
 :commands
  sort-tab-select-next-tab
  sort-tab-select-prev-tab
  sort-tab-select-last-tab
  sort-tab-close-other-tabs
  sort-tab-close-current-tab
  sort-tab-close-all-tabs
;;  :init
;;  (sort-tab-mode 1)
  :bind
        (:map doom-leader-map
         ("`" ("Switch to Last Buffer" . sort-tab-select-last-tab)))
  :init
  (map! :map doom-leader-map
    (:prefix ("b" . "Buffer")
          :desc "Next Buffer"
      "]" #'sort-tab-select-next-tab
      :desc "Next Buffer"
      "n" #'sort-tab-select-next-tab
      :desc "Previous Buffer"
      "[" #'sort-tab-select-prev-tab
      :desc "Previous Buffer"
      "p" #'sort-tab-select-prev-tab
      :desc "Switch to Last Buffer"
      "l" #'sort-tab-select-last-tab
      :desc "Kill all Buffers"
      "K" #'sort-tab-close-all-tabs
      :desc "Kill Other Buffers"
      "O" #'sort-tab-close-other-tabs
      :desc "Kill Buffer"
      "d" #'sort-tab-close-current-tab
      :desc "Kill Buffer"
      "k" #'sort-tab-close-current-tab)))
