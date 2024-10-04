;;; baosize/cc-extra/config.el -*- lexical-binding: t; -*-

(set-formatter! 'clang-format
  '("clang-format"
    ("-assume-filename=%s" (or buffer-file-name mode-result "")))
  :modes '((c++-mode ".cpp")))

(setq-hook! 'c++-mode-hook fill-column 100)
(setq-hook! 'c++-mode-hook c-basic-offset 4)
(setq-hook! 'c++-mode-hook c-default-style "bsd")
(after! c++-mode
  (map!
   :map
   (:leader
    (:prefix ("d" . "debug")
     :desc "Run cpp in gdb"
     :n "c" #'cpp-gdb)))
  (defun cpp-gdb ()
    (interactive)
    (if buffer-file-name
        (let ((filename (file-name-sans-extension (file-name-nondirectory buffer-file-name))))
          (when (eq 0 (shell-command (concat "clang++ -g -std=c++2c " buffer-file-name " -o /tmp/cpp-" filename)))
            (gdb (concat "gdb -i=mi /tmp/cpp-" filename))))
      (message "buffer-file-name is nil"))))
