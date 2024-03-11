;; init-funcs.el --- Define functions.	-*- lexical-binding: t -*-

;; Font
(defun font-installed-p (font-name)
  "Check if font with FONT-NAME is available."
  (find-font (font-spec :name font-name)))


(defun icons-displayable-p ()
  "Return non-nil if icons are displayable."
       (or (featurep 'nerd-icons)
           (require 'nerd-icons nil t)))

(provide 'init-funcs)
