;;; init-evil.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; evil配置，仿VIM

;;; Code:

(use-package evil
  :ensure t
  :init
  (setq evil-disable-insert-state-bindings t)
  :config
  (define-key evil-normal-state-map (kbd "<tab>") 'org-cycle)

  :hook (after-init . evil-mode)
  )
(provide 'init-evil)
