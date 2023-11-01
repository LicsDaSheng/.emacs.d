

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

(provide 'init-ui)
