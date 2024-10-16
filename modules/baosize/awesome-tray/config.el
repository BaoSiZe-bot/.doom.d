(use-package! awesome-tray
  :config
  (awesome-tray-mode 1)
  (setq awesome-tray-belong-update-duration 1
        awesome-tray-file-path-show-filename t
        awesome-tray-file-path-full-dirname-levels 1
        awesome-tray-active-modules '("location"
                                      "input-method"
                                      "belong"
                                      "buffer-read-only"
                                      "meow"
                                      "mode-name")
        awesome-tray-input-method-local-style "㞢"))
