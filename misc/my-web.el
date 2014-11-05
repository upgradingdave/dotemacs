;; nxhtml mode is based on nxml mode
;(load (expand-file-name
;"~/.emacs.d/dparoulek/thirdparty/nxhtml/autostart.el"))

;; Prefer sgml-mode for html at the moment
(add-to-list 'auto-mode-alist '("\\.html\\'" . sgml-mode))

;; this adds some extra goodness for expand-region when working with html
(require 'html-mode-expansions)
(er/enable-mode-expansions 'sgml-mode 'er/add-html-mode-expansions)

;; zencoding
(add-hook 'sgml-mode-hook 'zencoding-mode)

;; css goodness, this is part of auto-complete mode
(require 'auto-complete-config)
(add-hook 'css-mode-hook 'ac-css-mode-setup)

;; SCSS
(scss-compile-at-save nil)
(scss-output-directory nil)



;; slime-js for auto refreshing of browser, see setup/my-slime-js.el
;; for more info
;; (add-hook 'after-init-hook
;;           #'(lambda ()
;;               (add-to-list 'load-path "~/.emacs.d/dparoulek/setup")
;;               (when (locate-library "slime-js")
;;                 (require 'my-slime-js))))

;; (add-hook 'after-change-major-mode-hook
;;           #'(lambda ()
;;               (progn
;;                 (dp/minor-mode-setup "css" 'slime-js-minor-mode)
;;                 (dp/minor-mode-setup "html" 'slime-js-minor-mode)
;;                 (dp/minor-mode-setup "js" 'slime-js-minor-mode))))
