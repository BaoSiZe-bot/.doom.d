(use-package! breadcrumb  :hook (prog-mode . breadcrumb-local-mode))
(require 'treesit)
(require 'posframe)

(defgroup treesit-context nil
  "Show the context of the currently visible buffer contents."
  :group 'treesit)

(defvar treesit-context--buffer (generate-new-buffer "*treesit-context-posframe-buffer*")
  "Buffer used to display the context.")

(defvar treesit-context--list nil
  "List used to store the context needs showing.")

(defvar treesit-context--timer nil
  "Timer for updating the context.")

(defcustom treesit-context--background "#454545"
  "Background color for the context."
  :group 'treesit-context)

(defun treesit-context ()
  "Show code context."
  (interactive)
  (unless (not (treesit-available-p))
    (local-unset-key (kbd "C-g"))
    (local-set-key (kbd "C-g") 'treesit-context-abort)
    ;; (add-hook 'post-command-hook #'treesit-context--update nil 'local)
    (setq treesit-context--timer (run-with-idle-timer 0.1 t 'treesit-context--update))
    (treesit-context--update)))

(defun treesit-context-abort ()
  "Abort showing code context."
  (interactive)
  (posframe-hide treesit-context--buffer)
  (local-set-key (kbd "C-g") 'keyboard-quit)
  ;; (kill-buffer treesit-context--buffer)
  ;; (remove-hook 'post-command-hook #'treesit-context--update 'local)
  (when treesit-context--timer
    (cancel-timer treesit-context--timer)))

(defun treesit-context--add-to-list (node)
  "Add the text of the node into `treesit-context--list'."
  (if (or (string= (treesit-node-type node) "if_statement")
      (string= (treesit-node-type node) "for_statement")
      (string= (treesit-node-type node) "struct_specifier")
      (string= (treesit-node-type node) "while_statement")
      (string= (treesit-node-type node) "function_definition"))
      (progn
    (let* ((text (treesit-node-text node))
           (buf (generate-new-buffer "*treesit-context-temp-buffer*"))
           (text-showed nil))
      (with-current-buffer buf
        (goto-char (point-min))        (insert text)
        (goto-char (point-min))
        (setq text-showed (buffer-substring
                   (point-min) (line-end-position))))
      (push text-showed treesit-context--list)
      (kill-buffer buf)))))

(defun treesit-context--get-context-from-list ()
  "Get the context of `treesit-context--list'"
  (let ((context ""))
    (dolist (text treesit-context--list)
      (setq context (concat context text "\n")))
    context))

(defun treesit-context--update ()
  "Update `treesit-context--ov'."
  (unless (or (minibufferp) (not (buffer-live-p treesit-context--buffer)))
    (setq treesit-context--list nil)
    (ignore-errors
      (let* ((node (treesit-node-at (point))))
    (cl-loop while node
         do (treesit-context--add-to-list node)
         do (setq node (treesit-node-parent node)))))
    (if treesit-context--list
    (progn
      (with-current-buffer treesit-context--buffer
        (erase-buffer)
        (insert (treesit-context--get-context-from-list)))
      (when (posframe-workable-p)
        (posframe-show treesit-context--buffer
               :poshandler #'posframe-poshandler-window-top-right-corner
               :background-color "#454545"
               :border-width 5
               :border-color "#454545")))
      (posframe-hide treesit-context--buffer))))

(after! c++-ts-mode (treesit-context))
