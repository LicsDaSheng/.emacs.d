;;; init-org.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; org 配置

;;; Code:

;; 设置agenda扫描目录
(setq org-agenda-files '("~/sync-repo/01-note"
                         "~/sync-repo/dsl-org"))

;; 设置缩进
(add-hook 'org-mode-hook #'org-indent-mode)

;; 设置org中表格的中文对齐问题
(use-package valign
  :ensure t
  :hook (org-mode . 'valign-mode)
  :config
  (setq valign-signal-parse-error 'non-nil))



(provide 'init-org)
