;; (use-package auto-complete
;;   :ensure t
;;   :init
;;   (progn
;;     (ac-config-default)
;;     (global-auto-complete-mode t)
;;     (setq ac-use-menu-map t)
;;     (define-key ac-menu-map (kbd "C-n") 'ac-next)
;;     (define-key ac-menu-map (kbd "C-p") 'ac-previous)
;;     (define-key ac-mode-map (kbd "C-/") 'auto-complete)
;;     )
;; )
;; (use-package company
;;   :ensure t
;;   :hook (prog-mode . 'company-mode)
;;   :config
;;   (setq company-tooltip-limit 10
;; 	company-tooltip-align-annotations t
;; 	company-tooltip-width-grow-only t
;; 	company-abort-manual-when-too-short t
;; 	company-require-match nil
;; 	company-backends '(company-capf)
;; 	company-tooltip-margin 0)
;;   (with-eval-after-load "company"
;;     (define-key company-active-map [tab] 'company-complete-common-or-cycle)
;;     (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
;;     (define-key company-active-map (kbd "C-p") #'company-select-previous)
;;     (define-key company-active-map (kbd "C-n") #'company-select-next)))
(use-package corfu
  :ensure t
  :config
  (progn
    (setq tab-always-indent 'complete)
    (setq completion-styles '(orderless basic))
    (setq completion-category-defaults nil
	  completion-category-overrides nil
	  completion-cycle-threshold 4)
    (setq-default corfu-auto t)
    (with-eval-after-load 'eshell
      (add-hook 'eshell-mode-hook (lambda () (setq-local corfu-auto nil))))
    (setq-default corfu-quit-no-match 'separator)
    (add-hook 'after-init-hook 'global-corfu-mode)

    (with-eval-after-load 'corfu
      (corfu-popupinfo-mode))

    ))


(provide 'init-corfu) 
