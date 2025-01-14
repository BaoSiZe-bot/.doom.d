(add-hook 'doom-first-input-hook (lambda ()
(require 'lspce)
(setq lspce-send-changes-idle-time 1)
(defadvice! lspce--root-uri-always-allow-single (&rest _)
  :around 'lspce--root-uri
 (let ((proj (project-current))
       root-uri)
   (setq root-uri
         (if proj
             (project-root proj)
          buffer-file-name))
   (when root-uri
     (lspce--path-to-uri root-uri))))
;; log file
(lspce-disable-logging)
(defun lsp! (&rest _)
  (interactive)
  (lspce-mode 1))
(add-hook! 'c++-ts-mode-hook #'lsp!)
(bind-keys :map doom-leader-code-map
           ("r" . lspce-rename)
           ("a" . lspce-code-actions))))

(provide 'load-lspce)
