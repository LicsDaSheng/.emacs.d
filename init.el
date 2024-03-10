;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; 主加载配置文件

;;; Code:

;; 加载个人配置文件

;; bug fix ‘max-lisp-eval-depth' error
(setq elpy-shell-echo-output nil)


(require 'package)
(setq package-archives
      '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
        ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))


;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure nil)
  (setq use-package-always-defer nil)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally nil)
  (setq use-package-enable-imenu-support t))
(eval-when-compile
  (require 'use-package))



;; --debug-init implies `debug-on-error'.
(setq debug-on-error init-file-debug)

;; 设置自定义配置加载路径
(let ((dir (locate-user-emacs-file "lisp")))
  (add-to-list 'load-path (file-name-as-directory dir))
  (add-to-list 'load-path (file-name-as-directory (expand-file-name "lang" dir))))

;; 设置custom.el的文件路径
(setq custom-file (locate-user-emacs-file "custom.el"))



(require 'init-basic)
(require 'init-tools)
(require 'init-ivy)
(require 'init-org)
;;(require 'init-evil)

(provide 'init)

;;; init.el ends here
