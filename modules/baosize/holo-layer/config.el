;;; $DOOMDIR/modules/baosize/holo-layer/config.el -*- lexical-binding: t; -*-
(add-to-list 'load-path "~/.emacs.d/.local/straight/repos/blink-search/backend/")
(use-package holo-layer
  :custom
  (holo-layer-enable-cursor-animation t)
  (holo-layer-enable-type-animation t)
  (holo-layer-enable-indent-rainbow t)
  (holo-layer-cursor-color t)
  (holo-layer-cursor-alpha 255)
  (holo-layer-type-animation-style 'supernova)
  (holo-layer-sort-tab-ui)
  :config
  (holo-layer-enable))
