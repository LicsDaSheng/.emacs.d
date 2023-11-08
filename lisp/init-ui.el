

(add-to-list 'custom-theme-load-path "~/workspace/emacs/dasheng/site-lisp/monokai-theme")

(load-theme 'monokai 1)
(set-frame-font "Source Code Pro-14")

(set-frame-parameter nil 'alpha '(95 . 100))


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

;; 以弹框的形式展示
(use-package posframe
  :ensure t)

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode)
  :config
  (rainbow-delimiters-mode 1)
  (set-face-foreground 'rainbow-delimiters-depth-1-face "orange red")
  (set-face-foreground 'rainbow-delimiters-depth-2-face "gold")
  (set-face-foreground 'rainbow-delimiters-depth-3-face "yellow")
  (set-face-foreground 'rainbow-delimiters-depth-4-face "spring green")
  (set-face-foreground 'rainbow-delimiters-depth-5-face "cyan")
  (set-face-foreground 'rainbow-delimiters-depth-6-face "magenta")
  (set-face-foreground 'rainbow-delimiters-depth-7-face "goldenrod")
  (set-face-foreground 'rainbow-delimiters-depth-8-face "IndianRed1")
  (set-face-foreground 'rainbow-delimiters-depth-9-face "Ivory1")

  (set-face-bold 'rainbow-delimiters-depth-1-face "orange red")
  (set-face-bold 'rainbow-delimiters-depth-2-face "gold")
  (set-face-bold 'rainbow-delimiters-depth-3-face "yellow")
  (set-face-bold 'rainbow-delimiters-depth-4-face "spring green")
  (set-face-bold 'rainbow-delimiters-depth-5-face "cyan")
  (set-face-bold 'rainbow-delimiters-depth-6-face "magenta")
  (set-face-bold 'rainbow-delimiters-depth-7-face "goldenrod")
  (set-face-bold 'rainbow-delimiters-depth-8-face "IndianRed1")
  (set-face-bold 'rainbow-delimiters-depth-9-face "Ivory1")
  )
(provide 'init-ui)
