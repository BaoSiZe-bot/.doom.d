;;; ui/doom/config.el -*- lexical-binding: t; -*-
(setq pos-tip-internal-border-width 6
      pos-tip-border-width 1)
(use-package! doom-themes
  :hook (doom-load-theme . doom-themes-org-config)
  :init (setq doom-theme 'doom-moonlight))
(use-package! solaire-mode
  :hook (doom-load-theme . solaire-global-mode)
  :hook (+popup-buffer-mode . turn-on-solaire-mode))
