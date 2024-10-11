(use-package! awesome-tray
  :config
  (awesome-tray-mode 1)
  :init
  (setq awesome-tray-belong-update-duration 1)
  (setq awesome-tray-file-path-show-filename t)
  (setq awesome-tray-file-path-full-dirname-levels 1)
  (setq awesome-tray-active-modules '("last-command"
                                      "location"
                                      "word-count"
                                      "input-method"
                                      "belong"
                                      "evil"
                                      "file-path"
                                      "buffer-read-only"
                                      "mode-name"
                                      "battery"
                                      "git"
                                      "date"
                                      "clock"))
  (setq awesome-tray-input-method-local-style "㞢")
  (setq awesome-tray-input-method-default-style "EN")
  (setq awesome-tray-input-method-local-methods '("rime")))
