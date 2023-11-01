

(add-to-list 'custom-theme-load-path "~/workspace/emacs/dasheng/site-lisp/monokai-theme")
 
(load-theme 'monokai 1)
(set-frame-font "Source Code Pro-14")



(use-package simple
  :ensure nil
  :hook (after-init . size-indication-mode)
  :init
  (progn
    (setq column-number-mode t)
    ))

;; modeline 状态栏显示

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode t))


;; 设置美妙的图标
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p)) 


;; 增加分页符号,在长文本代码中很有效 添加分页符的快捷键为 C-q C-l
(use-package page-break-lines
  :ensure t
  :hook (after-init . global-page-break-lines-mode)
)

(provide 'init-ui)
