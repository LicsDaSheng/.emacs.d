;;; init-org.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; org 配置

;;; Code:

;; 设置默认启动的做换行对齐处理
(setq org-startup-indented t) 
;; 设置org中表格的中文对齐问题
(use-package valign
  :ensure t
  :hook (org-mode . 'valign-mode)
  :config
  (setq valign-signal-parse-error 'non-nil))

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
                         "~/sync-repo/dsl-org"
                         "~/sync-repo/dsl-org/gtd"))
(with-eval-after-load 'org-agenda
  (add-hook 'org-agenda-mode-hook
            (lambda () (add-hook 'window-configuration-change-hook 'org-agenda-align-tags nil t))))


;; GTD 配置
;; 设置todo 关键词, TODO 待办 NEXT 下一步马上就走 WAITTING 跟踪等待别人弯沉个 SOMEDAY 一个项目,没有决定什么时候做 
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
              (sequence "PROJECT(p)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
              (sequence "WAITING(w@/!)" "DELEGATED(e!)" "HOLD(h)" "|" "CANCELLED(c@/!)")))
      org-todo-repeat-to-state "NEXT")
(setq org-todo-keyword-faces
      (quote (("NEXT" :inherit warning)
              ("PROJECT" :inherit font-lock-string-face))))

 


(provide 'init-org)
