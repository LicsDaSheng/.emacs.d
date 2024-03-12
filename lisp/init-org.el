;;; init-org.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; org 配置

;;; Code:
(use-package org
  :ensure nil
  :hook (org-mode . visual-line-mode)
  :custom
  ;; 设置默认启动的做换行对齐处理
  (org-startup-indented t)
  ;; 设置连接地址显示，便于修改
  (org-link-descriptive nil)
  )

;; 使用org-bullets
(use-package org-bullets
  :ensure t
  :config 
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )

;; 设置org-download 用于录屏图片导入
;; (use-package org-download
;;   :ensure t 
;;   ;;将截屏功能绑定到快捷键：Ctrl + Shift + Y
;;   :bind ("C-S-a" . org-download-screenshot)
;;   :config
;;   (require 'org-download)
;;   ;; Drag and drop to Dired
;;   (add-hook 'dired-mode-hook 'org-download-enable)
;;   )
  
(use-package org-agenda
  :ensure nil
  :hook (org-agenda-finalize . org-agenda-to-appt)
  :config
  ;; update appt list every 5 minutes
  (run-at-time t 300 #'org-agenda-to-appt)
;;  (shut-up! #'org-agenda-to-appt)
  :custom
  ;; (org-agenda-files (list (expand-file-name "tasks.org" org-directory)))
  ;;(org-agenda-diary-file (expand-file-name "diary.org" org-directory))
  ;; 设置agenda扫描目录
  org-agenda-files '("~/sync-repo/01-note"
                         "~/sync-repo/dsl-org"
                         "~/sync-repo/dsl-org/gtd")
  (org-agenda-insert-diary-extract-time t)
  (org-agenda-inhibit-startup t)
  (org-agenda-time-leading-zero t)
  (org-agenda-columns-add-appointments-to-effort-sum t)
  (org-agenda-restore-windows-after-quit t)
  (org-agenda-window-setup 'current-window)
  ) 



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

 



;; org 自动生成页面ppt
(use-package ox-reveal
:ensure ox-reveal)

(setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js") 
(setq org-reveal-mathjax t)

(use-package htmlize
:ensure t)

;; 设置org中表格的中文对齐问题
;;(use-package valign
;;  :ensure t
;;  :hook (org-mode . 'valign-mode)
;;  :config
;;  (setq valign-signal-parse-error 'non-nil))

;;开启easy template <s 
;;(require 'org-tempo)

;;(with-eval-after-load 'org-agenda
;;  (add-hook 'org-agenda-mode-hook
;;            (lambda () (add-hook 'window-configuration-change-hook 'org-agenda-align-tags nil t))))
;; 内容居中显示。
(use-package olivetti
  :ensure t
  :config
  ;; 内容区域宽度，超过后自动折行。
  (setq-default olivetti-body-width 120)
  (add-hook 'org-mode-hook 'olivetti-mode))

;; org-present极其简约的演示工具
(use-package org-present
  :ensure t
  :config
  (autoload 'org-present "org-present" nil t)

  (add-hook 'org-present-mode-hook
            (lambda ()
              (org-present-big)
              (org-display-inline-images)))

  (add-hook 'org-present-mode-quit-hook
            (lambda ()
              (org-present-small)
              (org-remove-inline-images)))
  )
(provide 'init-org)
