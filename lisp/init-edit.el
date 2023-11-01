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

(provide 'init-edit)
