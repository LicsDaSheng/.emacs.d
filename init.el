;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; 主加载配置文件

;;; Code:

;; 加载个人配置文件

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-misc)
(require 'init-func)

(require 'init-melpa)

(require 'init-evil)
(require 'init-editor)
(require 'init-minibuffer)

(require 'init-org)

(require 'init-ui)
(require 'init-whichkey)
;;(require 'init-projectil)
(require 'init-dashboard)
(require 'init-coding) 
(require 'init-corfu)

(require 'init-vterm)


;;(require 'init-eaf)

(setq custom-file (locate-user-emacs-file "custom.el"))

(provide 'init)

;;; init.el ends here
