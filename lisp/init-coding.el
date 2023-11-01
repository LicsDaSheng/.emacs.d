;; (when (eq system-type 'darwin)
;;   (use-package exec-path-from-shell
;;     :ensure t)
;;   (setq exec-path-from-shell-arguments '("-l"))
;;   (add-hook 'after-init-hook #'exec-path-from-shell-initialize)
;;   (with-eval-after-load "go-mode"
;;     (with-eval-after-load "exec-path-from-shell"
;;       (exec-path-from-shell-copy-envs '("GOPATH" "GO111MODULE" "GOPROXY"))))) 

;; 项目管理
(require 'project)

(defun project-find-go-module (dir)
  (when-let ((root (locate-dominating-file dir "go.mod")))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  (cdr project))

(add-hook 'project-find-functions #'project-find-go-module)


;; Prettify Symbols
;; e.g. display “lambda” as “λ”
(defcustom centaur-prettify-symbols-alist
  '(("lambda" . ?λ)
    ("<-"     . ?←)
    ("->"     . ?→)
    ("->>"    . ?↠)
    ("=>"     . ?⇒)
    ("map"    . ?↦)
    ("/="     . ?≠)
    ("!="     . ?≠)
    ("=="     . ?≡)
    ("<="     . ?≤)
    (">="     . ?≥)
    ("=<<"    . (?= (Br . Bl) ?≪))
    (">>="    . (?≫ (Br . Bl) ?=))
    ("<=<"    . ?↢)
    (">=>"    . ?↣)
    ("&&"     . ?∧)
    ("||"     . ?∨)
    ("not"    . ?¬))
  "A list of symbol prettifications.
Nil to use font supports ligatures."
  :group 'centaur
  :type '(alist :key-type string :value-type (choice character sexp)))

(use-package prog-mode
  :ensure nil
  :hook (prog-mode . prettify-symbols-mode)
  :init
  (setq-default prettify-symbols-alist centaur-prettify-symbols-alist)
  (setq prettify-symbols-unprettify-at-point 'right-edge))

;; golang 语言配置
(use-package go-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
  )

(add-hook 'go-mode-hook 'eglot-ensure)

 
(provide 'init-coding)
