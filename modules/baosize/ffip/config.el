(use-package! find-file-in-project
  :commands
  ffip
  ffip-diff-find-file
  find-file-in-project
  find-file-in-project-at-point
  ffip-lisp-find-file-in-project
  find-file-in-current-directory
  find-file-in-project-by-selected
  :init
  (map! :map doom-leader-file-map
        :desc "Find File in Project"
        "f" 'ffip)
  (map! :leader
        :desc "Find file in project"
        " " 'ffip))
