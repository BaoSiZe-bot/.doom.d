;;; term/eshell/autoload/eshell.el -*- lexical-binding: t; -*-
(defun +eshell--unused-buffer (&optional new-p)
  (or (unless new-p
        (cl-loop for buf in (+eshell-buffers)
                 if (and (buffer-live-p buf)
                         (not (get-buffer-window buf t)))
                 return buf))
      (generate-new-buffer eshell-buffer-name)))

;;;###autoload
(defun +eshell-last-buffer (&optional noerror)
  "Return the last opened eshell buffer."
  (let ((buffer (cl-find-if #'buffer-live-p (+eshell-buffers))))
    (cond (buffer)
          (noerror nil)
          ((user-error "No live eshell buffers remaining")))))

;;;###autoload
(defun +eshell-buffers ()
  "TODO"
  (ring-elements +eshell-buffers))

;;;###autoload
(defun +eshell-run-command (command &optional buffer)
  "TODO"
  (let ((buffer
         (or buffer
             (if (eq major-mode 'eshell-mode)
                 (current-buffer)
               (cl-find-if #'buffer-live-p (+eshell-buffers))))))
    (unless buffer
      (user-error "No living eshell buffers available"))
    (unless (buffer-live-p buffer)
      (user-error "Cannot operate on a dead buffer"))
    (with-current-buffer buffer
      (goto-char eshell-last-output-end)
      (goto-char (line-end-position))
      (insert command)
      (eshell-send-input nil t))))

;;;###autoload
(defun +eshell/toggle (arg &optional command)
  "Toggle eshell popup window."
  (interactive "P")
  (let ((eshell-buffer
         (get-buffer-create
          (format "*doom:eshell-popup:%s*"
                  (if (bound-and-true-p persp-mode)
                      (safe-persp-name (get-current-persp))
                    "main"))))
        confirm-kill-processes
        current-prefix-arg)
    (when arg
      (when-let (win (get-buffer-window eshell-buffer))
        (delete-window win))
      (when (buffer-live-p eshell-buffer)
        (with-current-buffer eshell-buffer
          (fundamental-mode)
          (erase-buffer))))
    (if-let (win (get-buffer-window eshell-buffer))
        (let (confirm-kill-processes)
          (delete-window win)
          (ignore-errors (kill-buffer eshell-buffer)))
      (with-current-buffer eshell-buffer
        (doom-mark-buffer-as-real-h)
        (if (eq major-mode 'eshell-mode)
            (run-hooks 'eshell-mode-hook)
          (eshell-mode))
        (when command
          (+eshell-run-command command eshell-buffer)))
      (pop-to-buffer eshell-buffer))))

;;;###autoload
(defun +eshell/here (&optional command)
  "Open eshell in the current window."
  (interactive "P")
  (let ((buf (+eshell--unused-buffer)))
    (with-current-buffer (switch-to-buffer buf)
      (if (eq major-mode 'eshell-mode)
          (run-hooks 'eshell-mode-hook)
        (eshell-mode))
      (when command
        (+eshell-run-command command buf)))
    buf))

;;;###autoload
(defvar eshell-buffer-name "*doom:eshell*")

(defvar +eshell-buffers (make-ring 25)
  "List of open eshell buffers.")

(defvar +eshell--last-buffer nil)

;;;###autoload
(defun run-in-eshell (command &optional here)
  (interactive
   (list
    (let* ((f (cond (buffer-file-name)
                    ((eq major-mode 'dired-mode)
                     (dired-get-filename nil t))))
           (filename (if f
                         (concat " " (shell-quote-argument f))
                       "")))
      (read-shell-command "Terminal command: "
                          (cons filename 0)
                          (cons 'shell-command-history 1)
                          (list filename)))))
  (let ((buffer (+eshell-last-buffer t)))
    (cond (buffer
           (select-window (get-buffer-window buffer))
           (+eshell-run-command command buffer))
          (here
           (+eshell/here command))
          (t
           (+eshell/toggle nil command)))))

;;;###autoload
(defun run-code-eshell ()
  (interactive)
  (if buffer-file-name
      (let ((file-name (shell-quote-argument
                        (file-name-sans-extension
                         (file-name-nondirectory buffer-file-name))))
            (file-path (shell-quote-argument buffer-file-name))
            (dir (shell-quote-argument
                  (if (doom-project-root) (doom-project-root)
                    (file-name-directory buffer-file-name)))))
        (pcase major-mode
          ('c-ts-mode (run-in-eshell (concat "cd " dir " && "
                                          "gcc -O2 -std=c11 "
                                          file-path
                                          " -o /tmp/c-" file-name
                                          " && /tmp/c-" file-name)))
          ('c++-ts-mode (run-in-eshell (concat "cd " dir " && "
                                            "g++ -O2 -std=gnu++17 "
                                            file-path
                                            " -o /tmp/cpp-" file-name
                                            " && /tmp/cpp-" file-name)))
          ('python-ts-mode (run-in-eshell (concat "cd " dir " && "
                                               "python " file-path)))
          (_ (message "not supported"))))

    (message "buffer-file-name is nil")))

;;;###autoload
(defun run-cpp-fsanitize-eshell ()
  (interactive)
  (if buffer-file-name
      (let ((file-name (shell-quote-argument
                        (file-name-sans-extension
                         (file-name-nondirectory buffer-file-name))))
            (file-path (shell-quote-argument buffer-file-name))
            (dir (if (doom-project-root) (doom-project-root)
                   (file-name-directory buffer-file-name))))
        (run-in-eshell (concat "cd " dir " && " "clang++ -O2 -std=c++17 -fsanitize=undefined " file-path " -o /tmp/cpp-" file-name " && /tmp/cpp-" file-name)))
    (message "buffer-file-name is nil")))
