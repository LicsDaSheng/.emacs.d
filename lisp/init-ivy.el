(when (maybe-require-package 'ivy)
  ;; 打开ivy
  (ivy-mode 1)
  
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d)")
  (global-set-key (kbd "C-s") 'swiper-isearch)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "M-y") 'counsel-yank-pop)
  (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
  (global-set-key (kbd "C-c v") 'ivy-push-view)
  (global-set-key (kbd "C-c V") 'ivy-pop-view)
  )

(when (maybe-require-package 'counsel)
  (global-set-key (kbd "M-x") 'counsel-M-x))


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
   (setq ivy-posframe-display-functions-alist '(
                                                (swiper . ivy-posframe-display-at-point)
                                                (t . ivy-posframe-display-at-window-center)))
   (ivy-posframe-mode 1))

(provide 'init-ivy)

