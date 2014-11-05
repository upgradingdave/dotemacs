;;defun dp/nrepl-kill ()
;; (interactive)
;; (mapcar (lambda (x) (kill-buffer x)) 
;;         (remove-if-not (lambda (x) (string-match "\\*nrepl.*" (buffer-name x))) (buffer-list))))

;; (setq nrepl-server-command "lein repl :headless :dev")

;;global-set-key (kbd "C-x j") 'nrepl-jack-in)
;;add-hook 'clojure-mode-hook
;;         (lambda () 
;;           (if (string-match "^.*\\.clj$" (buffer-file-name)) 
;;               (add-hook 'after-save-hook 'nrepl-load-current-buffer
;;                         nil t
;;                         ))))

;; (require 'nrepl)
