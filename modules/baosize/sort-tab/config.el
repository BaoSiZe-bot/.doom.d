(use-package! sort-tab
  :config
  (sort-tab-mode 1)
  :init
  (map! :map doom-leader-buffer-map
        :desc "Next Buffer"
        "]" 'sort-tab-select-next-tab
        :desc "Next Buffer"
        "n" 'sort-tab-select-next-tab
        :desc "Previous Buffer"
        "[" 'sort-tab-select-prev-tab
        :desc "Previous Buffer"
        "p" 'sort-tab-select-prev-tab
        :desc "Switch to Last Buffer"
        "l" 'sort-tab-select-last-tab
        :desc "Kill all Buffers"
        "K" 'sort-tab-close-all-tabs
        :desc "Kill Other Buffers"
        "O" 'sort-tab-close-other-tabs
        :desc "Kill Buffer"
        "d" 'sort-tab-close-current-tab
        :desc "Kill Buffer"
        "k" 'sort-tab-close-current-tab)
  (map! :leader
        :desc "Switch to Last Buffer"
        "`" 'sort-tab-select-last-tab))
