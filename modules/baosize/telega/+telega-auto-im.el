;;; baosize/telega/+telega-auto-im.el -*- lexical-binding: t; -*-

;; based on cnsunyour's configs

(defcustom +telega--chat-cn-list nil
  "`telega' 里中文对话列表，用于自动切换到中文输入。"
  :type 'list
  :group 'telega)

(defcustom +telega--chat-en-list nil
  "`telega' 里英文对话列表，用于自动切换到英文输入。"
  :type 'list
  :group 'telega)

(defun +telega--save-encn-list ()
  "保存中英文对话列表。"
  (customize-save-variable '+telega--chat-cn-list +telega--chat-cn-list)
  (customize-save-variable '+telega--chat-en-list +telega--chat-en-list))

(defun +telega--add-cn-list (chat)
  "将当前聊天对话加入到中文列表中，以自动激活中文输入法。"
  (interactive (list (or telega-chatbuf--chat
                         telega--chat
                         (telega-chat-at (point)))))
  (let ((chatid (plist-get chat :id)))
    (cl-pushnew chatid +telega--chat-cn-list)
    (setq +telega--chat-en-list (cl-remove chatid +telega--chat-en-list))
    (+telega--save-encn-list)
    (message (concat "telega.el: Chat [\""
                     (telega-chat-title chat)
                     "\"] is added to CN chat list."))))

(defun +telega--add-en-list (chat)
  "将当前聊天对话加入到英文列表中，以自动关闭中文输入法。"
  (interactive (list (or telega-chatbuf--chat
                         telega--chat
                         (telega-chat-at (point)))))
  (let ((chatid (plist-get chat :id)))
    (cl-pushnew chatid +telega--chat-en-list)
    (setq +telega--chat-cn-list (cl-remove chatid +telega--chat-cn-list))
    (+telega--save-encn-list)
    (message (concat "telega.el: Chat [\""
                     (telega-chat-title chat)
                     "\"] is added to EN chat list."))))

(defun +telega--remove-from-list (chat)
  "将当前聊天对话从中英文列表中删除，将根据对话名称自动切换中英文输入法。"
  (interactive (list (or telega-chatbuf--chat
                         telega--chat
                         (telega-chat-at (point)))))
  (let ((chatid (plist-get chat :id)))
    (setq +telega--chat-en-list (cl-remove chatid +telega--chat-en-list))
    (setq +telega--chat-cn-list (cl-remove chatid +telega--chat-cn-list))
    (+telega--save-encn-list)
    (message (concat "telega.el: Chat [\""
                     (telega-chat-title chat)
                     "\"] is removed from EN/CN chat list."))))

;; Determine the function which has advice is available.
(unless (fboundp 'telega-chat--pop-to-buffer)
  (error "Function `telega-chat--pop-to-buffer' is not available."))
(define-advice telega-chat--pop-to-buffer (:after (chat &rest _) toggle-input-method-a)
  "在 telega-chat-mode 里根据 chat 名称切换输入法，如果名称包含
中文，则激活中文输入法，否则关闭中文输入法"
  (let ((title (telega-chat-title chat))
        (chatid (plist-get chat :id)))
    (cond ((member chatid +telega--chat-cn-list) (activate-input-method default-input-method))
          ((member chatid +telega--chat-en-list) (deactivate-input-method))
          ((telega-chat-bot-p chat) (deactivate-input-method))
          ((telega-chat-private-p chat) (activate-input-method default-input-method))
          ((string-match-p "\\cc" title) (activate-input-method default-input-method))
          (t (deactivate-input-method)))))
