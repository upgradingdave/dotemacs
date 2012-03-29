
;; M-x meta key shortcut
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

;; Markdown Mode
(setq auto-mode-alist (cons '("\.mkdwn" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\.markdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\.md" . markdown-mode) auto-mode-alist))

(eshell)
