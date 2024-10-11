(use-package! color-rg
  :commands
  color-rg-search-input
  color-rg-search-symbol
  color-rg-search-input-in-project
  color-rg-search-symbol-in-project
  color-rg-search-input-in-current-file
  color-rg-search-symbol-in-current-file
  color-rg-search-project-rails
  color-rg-search-symbol-with-type
  color-rg-search-project-with-type
  color-rg-search-project-rails-with-type
  :init
  (map! (:leader
         (:prefix ("r" . "run-in-vterm/ripgrep")
          :desc "ripgrep input"
          "i" #'color-rg-search-input
          :desc "ripgrep current symbol"
          "s" #'color-rg-search-symbol
          :desc "ripgrep current input in project"
          "I" #'color-rg-search-input-in-project
          :desc "ripgrep current symbol in project"
          "S" #'color-rg-search-symbol-in-project
          :desc "ripgrep input in buffer"
          "b" #'color-rg-search-input-in-current-file
          :desc "ripgrep current symbol in current file"
          "j" #'color-rg-search-symbol-in-current-file
          :desc "ripgrep input in buffer with same extentions"
          "t" #'color-rg-search-project-with-type
          :desc "ripgrep current symbol with same extentions"
          "x" #'color-rg-search-symbol-with-type))))
