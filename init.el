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
(require 'init-tab)
(require 'init-minibuffer)
(require 'init-ui)
(require 'init-evil)
(require 'init-whichkey)
;;(require 'init-projectil)
(require 'init-dashboard)
(require 'init-coding) 
(require 'init-complete)
(setq custom-file (locate-user-emacs-file "custom.el"))

(provide 'init)

;;; init.el ends here
