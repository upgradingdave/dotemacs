
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

;; completion at point
;; otherwise, M-. runs the command find-tag
;; TODO make this only for nxml mode
(global-set-key (kbd "M-.") 'completion-at-point)

;; TODO Was this an attempt to fix git in eshell?
;; (add-hook 'eshell-preoutput-filter-functions 
;;           'ansi-color-filter-apply)
