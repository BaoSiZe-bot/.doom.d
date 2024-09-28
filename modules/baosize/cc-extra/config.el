;;; baosize/google-c-style/config.el -*- lexical-binding: t; -*-

(set-formatter! 'clang-format
  '("clang-format"
    ("-assume-filename=%s" (or buffer-file-name mode-result "")))
  :modes '((c-mode ".c")
           (c++-mode ".cpp")
           (java-mode ".java")
           (objc-mode ".m")
           (protobuf-mode ".proto")))

(setq flycheck-cppcheck-checks "warning,performance,portability,unusedFunction")
(setq flycheck-cppcheck-standards "c++2c")

(set-file-template! "\\(acm\\|codeforces\\|oj\\|training\\).*\\.\\(cpp\\|cc\\|cxx\\)$" :trigger "acm")

(setq-hook! 'c-mode-common-hook
  fill-column 100)

(setq-local c-basic-offset 4)
(setq c-basic-offset 4)
(setq-default c-basic-offset 4)
(setq-hook! 'c-mode-common-hook c-basic-offset 4)
(setq-hook! 'c-mode-hook c-basic-offset 4)
(setq-hook! 'c++-mode-hook c-basic-offset 4)
(add-hook 'c++-mode-hook (lsp-bridge-mode))
(add-hook 'c-mode-hook (lsp-bridge-mode))
(add-hook 'c-mode-common-hook (lsp-bridge-mode))
(add-hook! 'c++-mode-hook (lsp-bridge-mode))
(add-hook! 'c-mode-hook (lsp-bridge-mode))
(add-hook! 'c-mode-common-hook (lsp-bridge-mode))
(after! c++-mode
  (map!
   :map (c++-mode-map)
   (:leader
    (:prefix ("d" . "debug")
     :desc "Run cpp in gdb"
     :n "c" #'cpp-gdb)))
  (defun cpp-gdb ()
    (interactive)
    (if buffer-file-name
        (let ((filename (file-name-sans-extension (file-name-nondirectory buffer-file-name))))
          (when (eq 0 (shell-command (concat "clang++ -O2 -g -std=c++17 " buffer-file-name " -o /tmp/cpp-" filename)))
            (gdb (concat "gdb -i=mi /tmp/cpp-" filename))))
      (message "buffer-file-name is nil"))))
