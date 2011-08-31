;; Javascript

;; I like js2-mode. So remove all associations for js files
(while (assoc-default "\\.js\\'" auto-mode-alist)
  (setq auto-mode-alist (assq-delete-all (car (assoc "\\.js\\'" auto-mode-alist)) auto-mode-alist)))

;; Set js2-mode as default
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(require 'js-comint)
(setq inferior-js-program-command 
      (concat "java -jar " 
	      (expand-file-name 
	       "~/src/javascript/env-js/env-js-from-git/rhino/js.jar")))
(add-hook 'js2-mode-hook 
	  '(lambda () 
	     (local-set-key "\C-x\C-e" 'js-send-last-sexp-and-go)
	     (local-set-key "\C-\M-x" 'js-send-region)
	     (local-set-key "\C-cb" 'js-send-buffer)
	     (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
	     (local-set-key "\C-cl" 'js-load-file-and-go)
	     ))


(defun switch-to-inf-js ()
  "Quickly switch to inferior js buffer"
  (interactive)
  (switch-to-buffer-other-window "*js*"))

(global-set-key "\C-c\C-j" 'switch-to-inf-js)
