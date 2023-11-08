(use-package vertico
  :ensure t
  :config
  (vertico-mode 1))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless)))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode t))


(use-package embark
  :ensure t
  :config
  (global-set-key (kbd "C-;") 'embark-act)
  (setq prefix-help-command 'embark-prefix-help-command))

(use-package embark-consult
  :ensure t)
(use-package consult
  :ensure t
  :bind (
	 ("C-s" . consult-line)
	 ("C-r" . consult-recent-file)
         ;; C-x bindings in `ctl-x-map'
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x t b" . consult-buffer-other-tab)    ;; orig. switch-to-buffer-other-tab
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-s d" . consult-find)                  ;; Alternative: consult-fd
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)

         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines))
        
  ;; 在 Completions 缓冲区中启用自动预览。
  :hook (completion-list-mode . consult-preview-at-point-mode)

  :init

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;;可选择调整寄存器预览窗口。这将添加细线、排序并隐藏窗口的模式行。
  (advice-add #'register-preview :override #'consult-register-window)
  
  )

;; 支持consult中文搜索
(progn
  (setq consult-locate-args (encode-coding-string "es.exe -i -p -r" 'gbk))
  (add-to-list 'process-coding-system-alist '("es" gbk . gbk))
  )
(eval-after-load 'consult
  (progn
    (setq
     consult-narrow-key "<"
     consult-line-numbers-widen t
     consult-async-min-input 2
     consult-async-refresh-delay  0.15
     consult-async-input-throttle 0.2
     consult-async-input-debounce 0.1)
    ))

 (use-package ivy-posframe
   :ensure t
   :after (ivy)
   :config
   ;; display at `ivy-posframe-style'
   ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
   ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
   ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-center)))
   ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-bottom-left)))
   ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-bottom-left)))
    (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
   (ivy-posframe-mode 1))

(provide 'init-minibuffer)

