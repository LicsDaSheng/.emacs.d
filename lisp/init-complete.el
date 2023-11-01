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

(provide 'init-complete) 
