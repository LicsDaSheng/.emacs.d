;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; 主加载配置文件

;;; Code:

;; 加载个人配置文件
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))


(require 'init-misc)
(require 'init-func)

(require 'init-melpa)
(require 'init-org)
(require 'init-edit)
(require 'init-ide)
(require 'init-minibuffer)

(setq custom-file (locate-user-emacs-file "custom.el"))

(provide 'init)

;;; init.el ends here
