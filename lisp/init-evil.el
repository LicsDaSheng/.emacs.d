;;; init-evil.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; evil配置，仿VIM

;;; Code:
(add-to-list 'load-path "~/.emacs.d/site-lisp/evil")
(require 'evil)
(evil-mode 1)

;; mode line设置，用于区分mode在不同模式的颜色
;;(add-to-list 'load-path "~/.emacs.d/site-lisp/evil-plugins")
;;(require 'evil-mode-line)


(provide 'init-evil)
