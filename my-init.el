;;; Ensure the following snippet is added to `.emacs.d/init.el`

;; (require 'package)
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (package-initialize)

;; (when (not package-archive-contents)
;;   (package-refresh-contents))

;;; Load favorite packages from elpa
(defvar my-packages '(starter-kit js2-mode magit php-mode slime-js js-comint ace-jump-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; TODO my-slime-js is loading before slime for some reason
(add-to-list 'load-path (concat user-emacs-directory user-login-name "/setup"))
;;(require 'my-slime-js)

