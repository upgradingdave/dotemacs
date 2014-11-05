
;; M-x meta key shortcut
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

;; Magit Rocks!
(global-set-key (kbd "C-x g") 'magit-status)

;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; Comment/uncomment region
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)

;; Start a new eshell even if one is active.
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

;; M-x c bound to compile
(global-set-key (kbd "C-x c") 'compile)

;; find-file-in-repository
(global-set-key (kbd "C-x f") 'find-file-in-repository)

;; grep and find

(global-set-key (kbd "C-c f") (lambda (pattern)
                                (interactive
                                 "sFind-name (filename wildcard): ")
                                (find-name-dired (expand-file-name ".") pattern)))

(global-set-key (kbd "C-c g") (lambda (pattern)
                                (interactive
                                 "sFind-grep (grep regexp): ")
                                (find-grep-dired (expand-file-name ".") pattern)))

;;vc-resolve-conflicts
(global-set-key (kbd "C-c v") 'vc-resolve-conflicts)

;; dired
; Reuse buffer when moving to parent
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "^")
              (lambda () (interactive) (find-alternate-file "..")))
                                        ; was dired-up-directory
            ))

;; completion at point
;; otherwise, M-. runs the command find-tag
;; TODO make this only for nxml mode
(global-set-key (kbd "M-.") 'completion-at-point)

(global-set-key (kbd "C-;") 'ace-jump-mode)

;; TODO Was this an attempt to fix git in eshell?
;; (add-hook 'eshell-preoutput-filter-functions 
;;           'ansi-color-filter-apply)

;; cleanup buffer
(global-set-key (kbd "C-c n") 'cleanup-buffer)

;; expand-region
(global-set-key (kbd "C-c C-2") 'er/expand-region)

;; multiple cursors
(global-set-key (kbd "C-c C-r") 'mc/mark-sgml-tag-pair)

;; zencoding
(global-set-key (kbd "C-c p") 'zencoding-preview)
