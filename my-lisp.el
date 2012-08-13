;; Lisp stuff

;; clojurescript
;;(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-mode))
;;(setq inferior-lisp-program "browser-repl")

;; highlight entire expression
(setq show-paren-style 'expression)

;; ;; turn off paredit 
;; (dolist (x '(scheme emacs-lisp lisp clojure))
;;   (when window-system
;;     (font-lock-add-keywords
;;      (intern (concat (symbol-name x) "-mode"))
;;      '(("(\\|)" . 'esk-paren-face))))
;;   ;; (add-hook
;;   ;;  (intern (concat (symbol-name x) "-mode-hook")) 'turn-on-paredit)
;;   (add-hook
;;       (intern (concat (symbol-name x) "-mode-hook")) 'run-coding-hook))


