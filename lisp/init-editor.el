;;; init-edit.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; 主加载配置文件

;;; Code:

;; (use-package undo-tree
;;   :ensure t
;;   :diminish
;;   :init
;;   (global-undo-tree-mode 1)
;;   (setq undo-tree-auto-save-history nil)
;;   (evil-set-undo-system 'undo-tree))
(use-package hungry-delete
  :ensure t
  :commands (global-hungry-delete-mode))

;;; 映射全角字符到半角字符
(let (
      ($replacePairs
       [
        ["，" ","]
        ["。" "."]
        ["；" ";"]
        ["：" ":"]
        ["【" "["]
        ["】" "]"]
        ["（" "("]
        ["）" ")"]
        ["！" "!"]
        ["、" "\\"]
        ["／" "/"]
        ["《" "<"]
        ["》" ">"]
        ["‘" "'"]
        ["’" "'"]
        ["“" "\""]
        ["”" "\""]
        ]
       ))
  (mapcar (lambda(x) (define-key key-translation-map
                                 (kbd (elt x 0)) (kbd (elt x 1)))) $replacePairs))


;; tab标签选择
(use-package awesome-tab
  :disabled
  :load-path "~/workspace/emacs/dasheng/site-lisp/awesome-tab"
  :config
  (awesome-tab-mode t))


;; 窗口选择
(use-package switch-window
  :ensure t
  :config
  (progn
    (setq-default switch-window-shortcut-style 'alphabet)
    (setq-default switch-window-timeout nil)
    (global-set-key (kbd "C-x o") 'switch-window))) 

(setq switch-window-default-window-size '(0.8 . 0.6)) 

(provide 'init-editor)
