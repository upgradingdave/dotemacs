
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

;; (setq x-select-enable-clipboard t)
;; (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; (add-hook 'eshell-preoutput-filter-functions 
;;           'ansi-color-filter-apply)

;; Markdown Mode
(add-to-list 'load-path "~/.emacs.d/elpa/markdown-mode-1.8.1")
(require 'markdown-mode)

(setq auto-mode-alist (cons '("\.mkdwn" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\.markdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\.md" . markdown-mode) auto-mode-alist))

(add-to-list 'load-path "~/.emacs.d/elpa/php-mode-1.5.0")
(require 'php-mode)

(eshell)
