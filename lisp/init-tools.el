

(use-package restart-emacs
  :ensure t)

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :hook (after-init . which-key-mode)
  :custom
  (which-key-idle-delay 0.5)
  (which-key-add-column-padding 1))
(provide 'init-tools)
