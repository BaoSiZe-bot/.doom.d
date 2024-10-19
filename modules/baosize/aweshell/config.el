;;; $DOOMDIR/modules/baosize/aweshell/config.el -*- lexical-binding: t; -*-
(map! :leader
    (:prefix ("l" . "Eshell")
     :desc "Run custom command"
     "c" #'run-in-eshell
     :desc "Run singile code file"
     "r" #'run-code-eshell
     :desc "Run cpp with fsantize"
     "f" #'run-cpp-fsanitize-eshell))
