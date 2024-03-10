;;; init-ivy.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; ivy 配置

;;; Code:



(use-package counsel
  :ensure t
  :diminish counsel-mode)

(use-package swiper
  :ensure t)

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :init
  (ivy-mode 1)
  (counsel-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  :bind
  ("C-s" . 'swiper-isearch)
  ("M-x" . 'counsel-M-x)
  ("C-x C-f" . 'counsel-find-file)
  ("C-y" . 'counsel-yank-pop)
  ("C-x b" . 'ivy-switch-buffer)
 )

 (use-package ivy-posframe  
   :disabled
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ivy.el ends here
