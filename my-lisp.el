;; Lisp stuff

;; Add all elpa directories to load-path
;;TODO: need to understand why I need this on mac, but not on linux?!
(let ((dir "~/.emacs.d/elpa"))
  (dolist (path (mapcar (lambda (x) (concat dir "/" x)) 
                        (remove-if (lambda (x) (or (equal x ".") (equal x ".."))) 
                                   (directory-files dir))))
    (add-to-list 'load-path path)))

(require 'rainbow-delimiters)

;; clojure (clojure-mode is installed in my-init.el) 

;; (add-hook 'clojure-test-mode-hook
;;           (lambda () 
;;             (add-hook 'after-save-hook 'clojure-test-run-test
;;                       nil t)))

;; highlight entire expression
;; Colors and styles controlled by the custom face `show-paren-match'
(setq show-paren-style 'parenthesis)

;; turn on paredit, and rainbow-delimiters
(dolist (x '(scheme emacs-lisp lisp clojure ielm))
  (add-hook
   (intern (concat (symbol-name x) "-mode-hook")) (lambda () (paredit-mode +1)))
  (add-hook
   (intern (concat (symbol-name x) "-mode-hook")) (lambda ()
   (rainbow-delimiters-mode +1))))

;; clojurescript
(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-mode))
;;(setq inferior-lisp-program "browser-repl")


;; TODO put these into a minor mode maybe?
(global-set-key (kbd "C-x x f") 'find-function)
(global-set-key (kbd "C-x x v") 'find-variable)
(global-set-key (kbd "C-x x x") (lambda () (interactive) (eval-buffer)
                                  (message "%s" "Evaluated Buffer!")))
