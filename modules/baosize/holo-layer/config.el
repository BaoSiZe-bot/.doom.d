(use-package! eaf
  :load-path "~/.emacs.d/.local/straight/repos/holo-layer/"
  :init
  (add-to-list 'load-path "~/.emacs.d/.local/straight/repos/holo-layer/")
  (require 'holo-layer)
  (setq holo-layer-enable-cursor-animation t)
  (setq holo-layer-enable-type-animation t)
  (setq holo-layer-enable-indent-rainbow t)
  (setq holo-layer-cursor-color t)
  (setq holo-layer-cursor-alpha 255)
  (setq holo-layer-type-animation-style 'supernova)
  (holo-layer-enable))
