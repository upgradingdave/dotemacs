;; markdown
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(require 'unbound)

;; command-frequency
;;(require 'command-frequency)
;;(command-frequency-table-load)
;;(command-frequency-mode 1)
;;(command-frequency-autosave-mode 1)

;;erc 
(setq erc-hide-list (quote ("JOIN" "QUIT")))

;;twittering-mode
(require 'twittering-mode)

;; nxhtml
;;(load "~/.emacs.d/vendor/nxhtml/autostart.el")

;; Pressing 'a' when in dired will reuse dired buffer when traversing
;; directories
(put 'dired-find-alternate-file 'disabled nil)
