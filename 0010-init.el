;; NOTE: no longer needed - A while ago it seemed that I needed this
;; on mac, but not on linux? Add all elpa directories to load-path
;; (let ((dir "~/.emacs.d/elpa")) 
;;   (dolist (path (mapcar 
;;                  (lambda (x) 
;;                    (concat
;;                     dir "/" x)) 
;;                  (remove-if (lambda (x) (or (equal x ".") (equal x "..")))))) 
;;     (add-to-list 'load-path path)))

;; Start emacs server so we can use emacsclient for things like magit
(server-start)

(dired default-directory)
