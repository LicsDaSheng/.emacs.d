;;; init-basic.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; ivy 配置

;;; Code:

;; Suppress GUI features and more
(setq use-file-dialog nil
      use-dialog-box nil
      inhibit-x-resources t
      inhibit-default-init t
      inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-buffer-menu t)

;; Pixelwise resize
(setq window-resize-pixelwise t
      frame-resize-pixelwise t)

;; Linux specific
(setq x-gtk-use-system-tooltips nil
      x-gtk-use-native-input t
      x-underline-at-descent-line t)

;; With GPG 2.1+, this forces gpg-agent to use the Emacs minibuffer to prompt
;; for the key passphrase.
(setq epg-pinentry-mode 'loopback)

;; Optimize for very long lines
(setq-default bidi-paragraph-direction 'left-to-right)
(setq bidi-inhibit-bpa t)

;; No backup files
(setq make-backup-files nil
      auto-save-default nil)

;; No lock files
(setq create-lockfiles nil)


;; Smooth scroll & friends
(setq scroll-step 2
      scroll-margin 2
      hscroll-step 2
      hscroll-margin 2
      scroll-conservatively 101
      scroll-preserve-screen-position 'always)

;; Dont move points out of eyes
(setq mouse-yank-at-point t)

(setq-default fill-column 80)

;; Inhibit switching out from `y-or-n-p' and `read-char-choice'
(setq y-or-n-p-use-read-key t
      read-char-choice-use-read-key t)


(use-package hl-line
  :ensure nil
  :when (display-graphic-p)
  :config
  (setq global-hl-line-sticky-flag t)
  :hook (after-init . global-hl-line-mode))

;; Recently opened files
(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode)
  :custom
  (recentf-max-saved-items 300)
  (recentf-auto-cleanup 'never)
  (recentf-exclude '(;; Folders on MacOS start
                     "^/private/tmp/"
                     "^/var/folders/"
                     ;; Folders on MacOS end
                     "^/tmp/"
                     "/ssh\\(x\\)?:"
                     "/su\\(do\\)?:"
                     "^/usr/include/"
                     "/TAGS\\'"
                     "COMMIT_EDITMSG\\'")))

;; MacOS specific
(use-package exec-path-from-shell
  :ensure t
  :when (eq system-type 'darwin)
  :hook (after-init . exec-path-from-shell-initialize))


;; 显示行号
(global-display-line-numbers-mode 1)

;; 删除选择项
(delete-selection-mode 1)

;; 括号字段补全
(electric-pair-mode 1)

;; 让 _ 视为单词的一部分
(add-hook 'after-change-major-mode-hook (lambda ()
					  (modify-syntax-entry ?_ "w")))

;; 让 - 视为单词的一部分
(add-hook 'after-change-major-mode-hook (lambda ()
					  (modify-syntax-entry ?- "w")))

;; 自动换行
(global-visual-line-mode 1) 

;; 透明背景。
(defun my/toggle-transparency ()
  (interactive)
  ;; 分别为 frame 获得焦点和失去焦点的不透明度。
  (set-frame-parameter (selected-frame) 'alpha '(90 . 90)) 
  (add-to-list 'default-frame-alist '(alpha . (90 . 90)))
  (add-to-list 'default-frame-alist '(alpha-background . 90)) ;; Emacs 29
  )
(my/toggle-transparency)

;; 没有制表符
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4) 

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


;; 设置自带的自动补全


(provide 'init-basic)
