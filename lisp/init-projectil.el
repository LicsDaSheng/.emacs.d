(use-package projectile
  :ensure t
  :hook (after-init . projectile-mode)
  :config
  (setq-default projectile-mode-line-prefix " Proj")) 

(provide 'init-projectil)
