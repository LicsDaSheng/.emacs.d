;;; init-misc.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; emacs系统的一些增强配置

;;; Code:
;; 快捷键设置
(setq mac-option-modifier 'meta
      mac-command-modifier 'super)

(global-set-key (kbd "s-a") 'mark-whole-buffer) ;;对应Windows上面的Ctrl-a 全选
(global-set-key (kbd "s-c") 'kill-ring-save) ;;对应Windows上面的Ctrl-c 复制
(global-set-key (kbd "s-s") 'save-buffer) ;; 对应Windows上面的Ctrl-s 保存
(global-set-key (kbd "s-v") 'yank) ;对应Windows上面的Ctrl-v 粘贴
(global-set-key (kbd "s-z") 'undo) ;对应Windows上面的Ctrol-z 撤销
(global-set-key (kbd "s-x") 'kill-region) ;对应Windows上面的Ctrol-x 剪切


;; 设置确认yes no 为 y n
(fset 'yes-or-no-p 'y-or-n-p)

;; 显示行号
(global-display-line-numbers-mode 1)

;; 删除选择项
(delete-selection-mode 1)

;; 去除临时文件
(setq make-backup-files nil)

;; 打开历史文件
(use-package recentf
  :config
  (recentf-mode 1)
  (setq recentf-max-menu-item 10))

;; 设置竖线鼠标显示
(setq-default cursor-type 'bar)


;; 高亮显示当前行
(global-hl-line-mode 1)

;; 自动加载外部修改过的文件。
(global-auto-revert-mode 1)

(use-package savehist
  :ensure t
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
	      history-length 1000
	      savehist-additional-variables '(mark-ring
					      global-mark-ring
					      search-ring
					      regexp-search-ring
					      extended-command-history)
	      savehist-autosave-interval 300)
  )

(use-package saveplace
  :ensure t
  :hook (after-init . save-place-mode))

(provide 'init-misc)
