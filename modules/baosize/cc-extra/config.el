;;; baosize/cc-extra/config.el -*- lexical-binding: t; -*-

(setq major-mode-remap-alist
      '((yaml-mode . yaml-ts-mode)
        (sh-mode . bash-ts-mode)
        (js-mode . js-ts-mode)
        (css-mode . css-ts-mode)
        (c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (c-or-c++-mode . c-or-c++-ts-mode)
        (python-mode . python-ts-mode)))
(setq-hook! 'c++-ts-mode-hook fill-column 80)
(setq-hook! 'c++-ts-mode-hook c-basic-offset 4)
(add-hook! 'c++-ts-mode-hook (indent-tabs-mode -1))
(setq-hook! 'c++-ts-mode-hook c-default-style "linux")
(setq-hook! 'c++-mode-hook fill-column 80)
(setq-hook! 'c++-mode-hook c-basic-offset 4)
(add-hook! 'c++-mode-hook (indent-tabs-mode -1))
(setq-hook! 'c++-mode-hook c-default-style "linux")
(after! c++-ts-mode
  (map! (:leader
    (:prefix ("d" . "debug")
     :desc "Run cpp in gdb"
     :n "c" #'cpp-gdb)))
  (defun cpp-gdb ()
    (interactive)
    (if buffer-file-name
        (let ((filename (file-name-sans-extension (file-name-nondirectory buffer-file-name))))
          (when (eq 0 (shell-command (concat "clang++ -g -std=c++2c \"" buffer-file-name "\" -o \"/tmp/cpp-" filename "\"")))
            (gdb (concat "gdb -i=mi \"/tmp/cpp-" filename "\""))))
      (message "buffer-file-name is nil"))))
