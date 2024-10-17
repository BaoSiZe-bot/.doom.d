;;; $DOOMDIR/modules/baosize/aweshell/config.el -*- lexical-binding: t; -*-
(use-package! aweshell
  :bind (:map doom-leader-open-map
            ("e" ("Toggle eshell" . aweshell-dedicated-toggle))
            ("E" ("Open eshell" . aweshell-dedicated-open)))
        (:map doom-leader-map
         ("lb" ("Switch buffer" . aweshell-switch-buffer))
         ("ln" ("Next buffer" . aweshell-next))
         ("lp" ("Prev buffer" . aweshell-prev))
         ("lc" ("Run custom command" . run-in-eshell))
         ("lr" ("Run single code file" . run-code-eshell))
         ("lf" ("Run cpp with fsanitize" . run-cpp-fsanitize-eshell))
         ("ls" ("Clear buffer" . aweshell-clear-buffer))))
