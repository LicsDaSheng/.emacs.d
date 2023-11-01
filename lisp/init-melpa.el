;;; init-melpa.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; melpa仓库配置

;;; Code:

(require 'package)

(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(setq package-enabel-at-startup nil)
(package-initialize)


(use-package restart-emacs
  :ensure t)

(use-package try
  :ensure t) 
(provide 'init-melpa)
