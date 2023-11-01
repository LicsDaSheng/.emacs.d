;; (when (eq system-type 'darwin)
;;   (use-package exec-path-from-shell
;;     :ensure t)
;;   (setq exec-path-from-shell-arguments '("-l"))
;;   (add-hook 'after-init-hook #'exec-path-from-shell-initialize)
;;   (with-eval-after-load "go-mode"
;;     (with-eval-after-load "exec-path-from-shell"
;;       (exec-path-from-shell-copy-envs '("GOPATH" "GO111MODULE" "GOPROXY"))))) 


(require 'project)

(defun project-find-go-module (dir)
  (when-let ((root (locate-dominating-file dir "go.mod")))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  (cdr project))

(add-hook 'project-find-functions #'project-find-go-module)

(use-package go-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
  )

(add-hook 'go-mode-hook 'eglot-ensure)

 
(provide 'init-languages)
