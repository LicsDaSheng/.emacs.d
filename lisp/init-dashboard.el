;; use-package with package.el:
(use-package dashboard
  :ensure t
  :init
  (dashboard-setup-startup-hook)
  :config
  ;; Set the title
  (progn
    (setq dashboard-banner-logo-title "Lics's Emacs Dashboard")
    ;; Set the banner
    ;;  (setq dashboard-startup-banner [VALUE])
    ;; Value can be
    ;; - nil to display no banner
    ;; - 'official which displays the official emacs logo
    ;; - 'logo which displays an alternative emacs logo
    ;; - 1, 2 or 3 which displays one of the text banners
    ;; - "path/to/your/image.gif", "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever gif/image/text you would prefer
    ;; - a cons of '("path/to/your/image.png" . "path/to/your/text.txt")

    ;; Content is not centered by default. To center, set
    (setq dashboard-center-content t)
    ;;(setq dashboard-set-heading-icons t)
    (setq dashboard-set-file-icons t)
    (setq dashboard-icon-type 'all-the-icons)
    (dashboard-modify-heading-icons '((recents . "file-text")
                                  ))
    )
  )

(provide 'init-dashboard)
