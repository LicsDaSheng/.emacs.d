;;; init-org.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; org 配置

;;; Code:


;; 设置缩进
(add-hook 'org-mode-hook #'org-indent-mode)

;; 设置org中表格的中文对齐问题
(use-package valign
  :ensure t
  :hook (org-mode . 'valign-mode)
  :config
  (setq valign-signal-parse-error 'non-nil))

;; org配置
(add-hook 'org-mode-hook #'org-indent-mode)
;; 使用org-bullets
(use-package org-bullets
  :ensure t
  :config 
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )

;开启easy template <s 
(require 'org-tempo)


;; agenda 配置
;; 设置agenda扫描目录
(setq org-agenda-files '("~/sync-repo/01-note"
                         "~/sync-repo/dsl-org"))
(with-eval-after-load 'org-agenda
  (add-hook 'org-agenda-mode-hook
            (lambda () (add-hook 'window-configuration-change-hook 'org-agenda-align-tags nil t))))



(provide 'init-org)
