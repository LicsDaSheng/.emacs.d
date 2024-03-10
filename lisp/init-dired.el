;;; init-dired.el --- dired tweaks -*- lexical-binding: t -*-
;;; Commentary:
;;
;; dired-narrow is superseded by `consult-focus-lines'.

;;; Code:

(use-package dired
  :ensure nil
  :bind (:map dired-mode-map
         ;; consistent with ivy
              ;; ("C-c C-e"   . wdired-change-to-wdired-mode)
              )
  :custom
  (dired-dwim-target t)
  (dired-bind-vm nil)
  (dired-kill-when-opening-new-dired-buffer t)
  ;; Dont prompt about killing buffer visiting delete file
  (dired-clean-confirm-killing-deleted-buffers nil)
  (dired-auto-revert-buffer #'dired-directory-changed-p)
  (dired-hide-details-hide-symlink-targets nil)
  (dired-listing-switches "-AFhlv"))

;; Make dired colorful
(use-package diredfl
  :ensure t
  :hook (dired-mode . diredfl-mode))

(provide  'init-dired)

