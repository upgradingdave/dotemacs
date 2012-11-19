;; Lisp stuff

;; clojurescript
;;(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-mode))
;;(setq inferior-lisp-program "browser-repl")

;; highlight entire expression
;; Colors and styles controlled by the custom face `show-paren-match'
(setq show-paren-style 'expression)

;; turn on paredit
(dolist (x '(scheme emacs-lisp lisp clojure))
  (add-hook
   (intern (concat (symbol-name x) "-mode-hook")) (lambda () (paredit-mode +1))))

;; TODO put these into a minor mode maybe?
(global-set-key (kbd "C-x x f") 'find-function)
(global-set-key (kbd "C-x x v") 'find-variable)
(global-set-key (kbd "C-x x x") (lambda () (interactive) (eval-buffer)
                                  (message "%s" "Evaluated Buffer!")))
